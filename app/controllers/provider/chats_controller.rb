class Provider::ChatsController < Provider::BaseController

  def index
    @chats = @current_provider.chats
    if params[:chat_id].present?
      @current_chat = @current_provider.chats.where(id: params[:chat_id]).first
    else
      @current_chat = @current_provider.chats.first
    end
    if @current_chat.present?
      @current_chatbox = Chatbox.new(@current_chat, @current_provider)
      @current_chatbox.mark_all_messages_as_read!
    end
  end

end