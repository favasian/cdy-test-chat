class Vendor < ApplicationRecord
  include ChatterCommons

  belongs_to :account
  has_many :non_clinical_job_posts


  def default_chat_member_group
    "vendor_group"
  end
end
