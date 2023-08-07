class CreateChatMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_members do |t|
      t.integer :chat_id
      t.references :chatter, polymorphic: true, null: false
      t.boolean :archived, default: false
      t.integer :unread_count, default: 0

      t.timestamps
    end
  end
end
