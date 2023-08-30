class RecruiterUser::MessagesController < RecruiterUser::BaseController

  def create
    @job_post = @current_account.job_posts.where(id: params[:job_post_id]).first
    chat = Chat.where(id: params[:chat_id]).first
    if @job_post.created_by_recruiter?
      chatbox = Chatbox.new(chat, @current_account)
      chatbox.send_proxy_message(@current_user, message_params[:content], nil)  
    else
      chatbox = Chatbox.new(chat, @job_post.owner)
      chatbox.send_proxy_message(@current_user, message_params[:content], nil)  
    end
    
    redirect_to user_job_post_path(@current_user, @job_post)
  end

  def edit
    @job_post = @current_account.job_posts.where(id: params[:job_post_id]).first
    @message = Chat::Message.find(params[:id])
  end

  def update
    @job_post = @current_account.job_posts.where(id: params[:job_post_id]).first
    @message = Chat::Message.find(params[:id])
    @message.update!(message_params)
    redirect_to user_job_post_path(@current_user, @job_post)
  end

  def add_office
    @job_post = @current_account.job_posts.where(id: params[:job_post_id]).first
    chat = Chat.where(id: params[:chat_id]).first
    chatbox = Chatbox.new(chat, @current_account)
    chatbox.add_chatter_as_member(@job_post.owner)
    redirect_to user_job_post_path(@current_user, @job_post)
  end

  def message_params
    params.require(:chat_message).permit(:content)
  end

end