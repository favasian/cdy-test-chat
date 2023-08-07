class Owner < ApplicationRecord
  include ChatterCommons

  belongs_to :account
  has_many :managers
  has_many :users, through: :managers
  has_many :job_posts
  has_many :job_applications, through: :job_posts

end
