class Account < ApplicationRecord
  include ChatterCommons

  belongs_to :user, optional: true #Lead user
  has_many :users
  has_one :provider, dependent: :destroy, autosave: true # enable autosave in order to update profile completeness automatically.
  has_many :owners, dependent: :destroy, autosave: true
  has_many :job_posts, through: :owners
  has_one :vendor, dependent: :destroy, autosave: true

  def default_chat_member_group(chat)
    if provider?
      "provider_group"
    elsif vendor?
      "vendor_group"
    else
      "office_account_group"
    end
  end

  def provider?
    provider.present?
  end

  def owner?
    owners.any?
  end

  def vendor?
    vendor.present?
  end

  def type
    if self.owner?
      "Owner"
    elsif self.provider?
      "Provider"
    elsif self.vendor?
      "Vendor"
    end
  end
end
