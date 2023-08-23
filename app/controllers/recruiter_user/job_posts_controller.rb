class RecruiterUser::JobPostsController < RecruiterUser::BaseController

  def index
    @job_posts = @current_account.job_posts
  end

  def show
    @job_post = @current_account.job_posts.where(id: params[:id]).first
  end
end