class Mailbox
  attr_reader :chatter

  def initialize(chatter, about=nil)
    @chatter = chatter
    @about = about
  end

  def send_message_to(receiver_chatter, content, about)
    chat = chat_with_chatter(receiver_chatter)
    member = chat.member_for_chatter(@chatter)
    chat.send_message(member, nil, content, about)
    chat
  end

  def sent?(message)
    @chatter.id == message.sender_member.chatter_id && @chatter.class.base_class.name == message.sender_member.chatter_type
  end

  def sent_by_group?(message)
    @chatter.default_chat_member_group(message.chat) == message.sender_member.group
  end

  private

  def chat_with_chatter(receiver_chatter)
    find_chat_with_chatter(receiver_chatter) || create_chat_with_chatter!(receiver_chatter)
  end

  def find_chat_with_chatter(receiver_chatter)
    rel = Chat
    chatters = [@chatter, receiver_chatter]
    chatters.each do |chatter|
      rel = rel.with_chatter(chatter)
    end
    if @about.present?
      rel = rel.where(about: @about)
    end
    rel.where(chat_member_count: chatters.count).first
  end

  def create_chat_with_chatter!(receiver_chatter)
    ActiveRecord::Base.transaction do
      chat = Chat.create!
      chat.about = @about
      find_or_create_member!(chat, @chatter)
      find_or_create_member!(chat, receiver_chatter)
      chat.save!
      chat
    end
  end

  def find_or_create_member!(chat, chatter)
    chat.member_for_chatter(chatter) || chat.members.create!(chatter: chatter, group: chatter.default_chat_member_group(chat))
  end

end