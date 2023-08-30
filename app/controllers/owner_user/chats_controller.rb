class OwnerUser::ChatsController < OwnerUser::BaseController

  def index
    @chats = @current_owner.chats
    if params[:chat_id].present?
      @current_chat = @current_owner.chats.where(id: params[:chat_id]).first
    else
      @current_chat = @current_owner.chats.first
    end
    if @current_chat.present?
      @current_chatbox = Chatbox.new(@current_chat, @current_owner)
      @current_chatbox.mark_all_messages_as_read!
    end
  end

  def send_message
    @chat = @current_owner.chats.where(id: params[:id]).first
    chatbox = Chatbox.new(@chat, @current_owner)
    chatbox.send_proxy_message(@current_user, message_params[:content], nil)
    redirect_to owner_user_chats_path(@current_owner, @current_user, chat_id: @chat.id)
  end

  def message_params
    params.require(:chat_message).permit(:content)
  end

end