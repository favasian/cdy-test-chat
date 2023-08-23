class Provider < ApplicationRecord
  include ChatterCommons

  belongs_to :account
  has_many :job_applications
  has_many :non_clinical_job_applications


  def default_chat_member_group
    "provider_group"
  end
end
