class AddSenderProxyToChatMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :chat_messages, :sender_proxy_id, :integer
    add_column :chat_messages, :sender_proxy_type, :string
  end
end
