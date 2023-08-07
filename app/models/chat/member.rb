class Chat::Member < ApplicationRecord

  belongs_to :chat
  belongs_to :chatter, polymorphic: true
  belongs_to :parent_member, class_name: 'Chat::Member'

  has_many :sent_messages, class_name: 'Chat::Message', foreign_key: :sender_chat_member_id
  has_many :recipient_receipts, class_name: 'Chat::RecipientReceipt', foreign_key: :chat_member_id
  has_many :received_chat_messages, through: :recipient_receipts, as: :chat_message




  def update_unread_count!
    self.unread_count = self.recipient_receipts.unread.count
    self.save!
  end
end
