class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|
      t.integer :messages_count
      t.string :last_message_content
      t.datetime :last_message_sent_at

      t.timestamps
    end
  end
end
