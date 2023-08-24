class Owner < ApplicationRecord
  include ChatterCommons

  belongs_to :account
  has_many :managers
  has_many :users, through: :managers
  has_many :job_posts
  has_many :job_applications, through: :job_posts
  has_many :non_clinical_job_posts
  has_many :non_clinical_job_applications, through: :non_clinical_job_posts

  def default_chat_member_group(chat)
    "office_account_group"
  end

end
