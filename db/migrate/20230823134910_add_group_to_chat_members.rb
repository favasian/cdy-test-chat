class AddGroupToChatMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :chat_members, :group, :string
  end
end
