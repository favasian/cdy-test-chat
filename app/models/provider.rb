class Provider < ApplicationRecord
  include ChatterCommons

  has_many :job_applications
  has_many :non_clinical_job_applications


end
