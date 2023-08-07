class AddParentMemberIdToChatMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :chat_members, :parent_member_id, :integer
  end
end
