module ChatterCommons
  extend ActiveSupport::Concern


  included do
    has_many :chat_members, class_name: 'Chat::Member', as: :chatter
    has_many :chats, through: :chat_members


    def default_chat_member_group
      raise "Chatter must override default_chat_member_group method"
    end

  end

end
