class User < ApplicationRecord
  include ChatterCommons
  include ChatMessageProxyCommons

  belongs_to :account
  has_many :managers
  has_many :owners, through: :managers
  
  delegate :provider?, :owner?, :vendor?, :default_chat_member_group, to: :account

  def proxy_name(chat_message)
    self.name
  end

end
