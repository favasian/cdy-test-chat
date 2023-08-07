class JobPostApplication < ApplicationRecord

  belongs_to :job_post
  belongs_to :provider
  has_many :messages, as: :about

end
