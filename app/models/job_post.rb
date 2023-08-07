class JobPost < ApplicationRecord

  belongs_to :owner
  has_many :job_post_applications

end
