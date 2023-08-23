class Provider::MessagesController < Provider::BaseController

  def create
    @chat = @current_provider.chats.where(id: params[:chat_id]).first
    Chatbox.new(@chat, @current_provider).send_message(message_params[:content], nil)
    redirect_to provider_chats_path(@current_provider, chat_id: @chat.id)
  end

  def edit
    @message = Chat::Message.find(params[:id])
  end

  def update
    @message = Chat::Message.find(params[:id])
    @message.update!(message_params)
    redirect_to provider_chats_path(@current_provider, chat_id: @message.chat_id)
  end


  def message_params
    params.require(:chat_message).permit(:content)
  end

end