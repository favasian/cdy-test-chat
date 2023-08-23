class VendorUser::NonClinicalJobPostsController < VendorUser::BaseController

  def index
    @job_posts = @current_vendor.non_clinical_job_posts
  end

  def show
    @highlight_job_post = @current_vendor.non_clinical_job_posts.where(id: params[:id]).first
    @job_posts = @current_vendor.non_clinical_job_posts
    render :index
  end

  def new
    @job_post = @current_vendor.non_clinical_job_posts.build
  end

  def create
    @job_post = @current_vendor.non_clinical_job_posts.build(non_clinical_job_posts_params)
    @job_post.save!
    redirect_to action: :index
  end


  def non_clinical_job_posts_params
    params.require(:non_clinical_job_post).permit(:name)
  end

end