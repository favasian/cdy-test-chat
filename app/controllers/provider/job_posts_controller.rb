class Provider::JobPostsController < Provider::BaseController

  def index
    @job_posts = JobPost.all
  end

  def show
    @highlight_job_post = JobPost.find(params[:id])
    @job_posts = JobPost.all
    render :index
  end

  def apply
    job_post = JobPost.find(params[:id])
    job_post.apply!(@current_provider)
    redirect_to action: :index
  end
end