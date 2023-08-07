class Account < ApplicationRecord
  include ChatterCommons

  belongs_to :user, optional: true #Lead user
  has_many :users
  has_one :provider, dependent: :destroy, autosave: true # enable autosave in order to update profile completeness automatically.
  has_many :owners, dependent: :destroy, autosave: true
  has_one :ambassador, dependent: :destroy, autosave: true # enable autosave in order to update profile completeness automatically.
  has_one :vendor, dependent: :destroy, autosave: true

  def provider?
    provider.present?
  end

  def owner?
    owners.any?
  end

  def ambassador?
    ambassador.present?
  end

  def vendor?
    vendor.present?
  end
end
