class OwnerUser::JobPostsController < OwnerUser::BaseController

  def index
    @job_posts = @current_owner.job_posts
  end

  def show
    @highlight_job_post = @current_owner.job_posts.where(id: params[:id]).first
    @job_posts = @current_owner.job_posts
    render :index
  end

  def new
    @job_post = @current_owner.job_posts.build
  end

  def create
    @job_post = @current_owner.job_posts.build(job_post_params)
    @job_post.created_by_user = @current_user
    @job_post.save!
    redirect_to action: :index
  end


  def job_post_params
    params.require(:job_post).permit(:name)
  end

end