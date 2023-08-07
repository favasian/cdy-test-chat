class CreateManagers < ActiveRecord::Migration[6.1]
  def change
    create_table :managers do |t|
      t.integer :user_id
      t.integer :owner_id

      t.timestamps
    end
  end
end
