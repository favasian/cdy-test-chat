class NonClinicalJobApplication < ApplicationRecord

  belongs_to :non_clinical_job_post
  belongs_to :provider
  has_many :messages, as: :about


  def about_name
    self.non_clinical_job_post.name
  end

  def about_object
    self.non_clinical_job_post
  end

end
