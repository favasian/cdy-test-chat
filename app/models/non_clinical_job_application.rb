class NonClinicalJobApplication < ApplicationRecord

  belongs_to :non_clinical_job_post
  belongs_to :provider
  has_many :messages, as: :about

end
