class Chat::Member < ApplicationRecord

  belongs_to :chat
  belongs_to :chatter, polymorphic: true

  has_many :sent_messages, class_name: 'Chat::Message', foreign_key: :sender_chat_member_id
  has_many :recipient_receipts, class_name: 'Chat::RecipientReceipt', foreign_key: :chat_member_id
  has_many :received_chat_messages, through: :recipient_receipts, as: :chat_message

  scope :for_chatter, -> (chatter) { where(chatter: chatter) }
  scope :show_in_chat_title, -> { where(show_in_chat_title: true) }

  after_create :update_chat_member_count!

  def update_chat_member_count!
    self.chat.update_chat_member_count!
  end

  def update_unread_count!
    self.unread_count = self.recipient_receipts.unread.count
    self.save!
  end
end
