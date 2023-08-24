class Chatbox < Mailbox

  attr_reader :chat

  def initialize(chat, chatter)
    super(chatter)
    @chat = chat
    @member = chat.member_for_chatter(chatter)
  end

  def send_proxy_message(sender_proxy, content, about=nil)
    @chat.send_message(@member, sender_proxy, content, about)
  end

  def send_message(content, about=nil)
    @chat.send_message(@member, nil, content, about)
  end

  def title
    chat.title(@member)
  end

  def unread_count
    @member.unread_count
  end

  def messages
    @chat.messages.includes(:sender_member).order(created_at: :asc)
  end

  def editable?(message)
    sent?(message) && message.created_at >= 5.minutes.ago
  end

  def last_message_content
    @chat.last_message_content
  end

  def last_message_sent_at
    @chat.last_message_sent_at.strftime("%D %I:%M:%S %p")
  end

  def mark_all_messages_as_read!
    #current implementation is to mark as read for all people in the same group
    @chat.members.where(group: @member.group).each do |member|
      member.recipient_receipts.unread.update_all(read_at: Time.current)
      member.update_unread_count!
    end
  end

end