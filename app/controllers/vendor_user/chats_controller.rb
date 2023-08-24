class VendorUser::ChatsController < VendorUser::BaseController

  def index
    @chats = @current_vendor.chats
    if params[:chat_id].present?
      @current_chat = @current_vendor.chats.where(id: params[:chat_id]).first
    else
      @current_chat = @current_vendor.chats.first
    end
    if @current_chat.present?
      @current_chatbox = Chatbox.new(@current_chat, @current_vendor)
      @current_chatbox.mark_all_messages_as_read!
    end
  end

  def send_message
    @chat = @current_vendor.chats.where(id: params[:id]).first
    chatbox = Chatbox.new(@chat, @current_vendor)
    chatbox.send_message(message_params[:content], nil)
    redirect_to vendor_user_chats_path(@current_vendor, @current_user, chat_id: @chat.id)
  end

  def message_params
    params.require(:chat_message).permit(:content)
  end

end