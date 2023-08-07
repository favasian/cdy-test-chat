class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.integer :account_id
      t.string :name

      t.timestamps
    end
  end
end
