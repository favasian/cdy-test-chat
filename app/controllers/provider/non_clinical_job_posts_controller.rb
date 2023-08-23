class Provider::NonClinicalJobPostsController < Provider::BaseController

  def index
    @job_posts = NonClinicalJobPost.all
  end

  def show
    @highlight_job_post = NonClinicalJobPost.find(params[:id])
    @job_posts = NonClinicalJobPost.all
    render :index
  end

  def apply
    job_post = NonClinicalJobPost.find(params[:id])
    job_post.apply!(@current_provider)
    redirect_to action: :index
  end

end