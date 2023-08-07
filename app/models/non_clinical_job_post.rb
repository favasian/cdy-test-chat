class NonClinicalJobPost < ApplicationRecord

  belongs_to :vendor
  has_many :non_clinical_job_applications

end
