class CreateChatRecipientReceipts < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_recipient_receipts do |t|
      t.integer :chat_member_id
      t.integer :chat_message_id
      t.datetime :read_at

      t.timestamps
    end
  end
end
