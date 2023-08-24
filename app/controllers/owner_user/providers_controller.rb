class OwnerUser::ProvidersController < OwnerUser::BaseController

  def index
    @providers = Provider.all
  end

  def send_message
    @provider = Provider.find(params[:id])
    chat = Mailbox.new(@current_owner).send_message_to(@provider, "Hello!", nil)
    redirect_to owner_user_chats_path(@current_owner, @current_user, chat_id: chat.id)
  end
end