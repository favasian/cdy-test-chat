class Chat < ApplicationRecord

  has_many :members, class_name: "Chat::Member", foreign_key: :chat_id
  has_many :messages, class_name: "Chat::Message", foreign_key: :chat_id
  belongs_to :about, polymorphic: true, optional: true


  has_many :sender_members, through: :messages
  has_many :recipient_receipts, through: :messages
  has_many :recipient_members, through: :messages

  scope :with_chatter, -> (chatter) { 
    chatter_base_class = chatter.class.base_class.to_s
    name = "cm_#{chatter_base_class}_#{chatter.id}"
    joins("LEFT JOIN chat_members #{name} ON #{name}.chat_id = chats.id").where("#{name}.chatter_id = #{chatter.id} AND #{name}.chatter_type = '#{chatter_base_class}'")
  }


  def member_for_chatter(chatter)
    self.members.for_chatter(chatter).first
  end

  def title(viewing_member)
    viewing_member = [viewing_member] unless viewing_member.is_a?(Array)
    (self.members - viewing_member).map{ |m| m.chatter.name }.join(', ')
  end

  def send_message(sender_member, sender_proxy, content, about)
    self.messages.create!(sender_member: sender_member, sender_proxy: sender_proxy, content: content, about: about)
  end


  def update_cached_details!
    last_message = self.messages.order(created_at: :asc).last
    self.messages_count = self.messages.count
    self.last_message_content = last_message.content
    self.last_message_sent_at = last_message.created_at
    self.save!
  end



  def update_chat_member_count!
    self.chat_member_count = self.members.count
    self.save!
  end


end
