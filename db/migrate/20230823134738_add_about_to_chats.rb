class AddAboutToChats < ActiveRecord::Migration[6.1]
  def change
    add_column :chats, :about_id, :integer
    add_column :chats, :about_type, :string
  end
end
