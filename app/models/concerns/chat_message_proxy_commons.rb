module ChatMessageProxyCommons
  extend ActiveSupport::Concern


  included do
  
    def proxy_name(chat_message)
      raise "ChatMessageProxy must override default_chat_member_group method"
    end

  end

end
