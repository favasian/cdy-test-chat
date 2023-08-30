class VendorUser::MessagesController < VendorUser::BaseController

  def create
    @chat = @current_vendor.chats.where(id: params[:chat_id]).first
    chatbox = Chatbox.new(@chat, @current_vendor)
    chatbox.send_proxy_message(@current_user, message_params[:content], nil)
    redirect_to vendor_user_chats_path(@current_vendor, @current_user, chat_id: @chat.id)
  end

  def edit
    @message = Chat::Message.find(params[:id])
  end

  def update
    @message = Chat::Message.find(params[:id])
    @message.update!(message_params)
    redirect_to vendor_user_chats_path(@current_vendor, @current_user, chat_id: @message.chat_id)
  end

  def message_params
    params.require(:chat_message).permit(:content)
  end

end