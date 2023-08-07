class Chat::RecipientReceipt < ApplicationRecord

  belongs_to :member, class_name: 'Chat::Member', foreign_key: :chat_member_id
  belongs_to :message, class_name: 'Chat::Message', foreign_key: :chat_message_id

  scope :read, -> { where.not(read_at: nil) }
  scope :unread, -> { where(read_at: nil) }

  after_update :update_member_unread_count!, if: :read_at_previously_changed?
  after_create :update_member_unread_count!

  def update_member_unread_count!
    self.member.update_unread_count!
  end
end
