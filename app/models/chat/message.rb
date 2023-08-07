class Chat::Message < ApplicationRecord

  belongs_to :chat
  belongs_to :about, polymorphic: true, optional: true
  belongs_to :sender_member, class_name: '::Chat::Member', foreign_key: :sender_chat_member_id

  has_many :members, through: :chat
  has_many :recipient_receipts, class_name: '::Chat::RecipientReceipt', foreign_key: :chat_message_id
  has_many :recipient_members, through: :recipient_receipts, source: :member


  after_create :create_receipts!

  private

  def create_receipts!
    self.members.each do |member|
      next if member == self.sender_member
      self.recipient_receipts.create!(member: member)
    end
    self.chat.update_cached_details!
  end
end
