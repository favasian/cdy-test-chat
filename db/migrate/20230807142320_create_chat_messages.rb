class CreateChatMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_messages do |t|
      t.integer :chat_id
      t.integer :about_id
      t.string :about_type
      t.string :content
      t.integer :sender_chat_member_id

      t.timestamps
    end
  end
end
