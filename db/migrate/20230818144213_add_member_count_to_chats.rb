class AddMemberCountToChats < ActiveRecord::Migration[6.1]
  def change
    add_column :chats, :chat_member_count, :integer, default: 0

    Chat.reset_column_information
    Chat.all.each do |chat|
      chat.update_chat_member_count!
    end
  end
end
