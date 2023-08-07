class Chat < ApplicationRecord

  has_many :members, class_name: "Chat::Member", foreign_key: :chat_id
  has_many :messages, class_name: "Chat::Message", foreign_key: :chat_id

  has_many :sender_members, through: :messages
  has_many :recipient_receipts, through: :messages
  has_many :recipient_members, through: :messages


  def send_message(sender_member, content, about)
    self.messages.create(sender_member: sender_member, content: content, about: about)
  end


  def update_cached_details!
    last_message = self.messages.order(created_at: :asc).last
    self.messages_count = self.messages.count
    self.last_message_content = last_message.content
    self.last_message_sent_at = last_message.created_at
    self.save!
  end

end
