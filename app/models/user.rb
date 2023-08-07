class User < ApplicationRecord
  include ChatterCommons

  belongs_to :account
  has_many :managers
  has_many :owners, through: :managers
  
  delegate :provider?, :owner?, :ambassador?, to: :account
end
