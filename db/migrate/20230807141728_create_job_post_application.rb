class JobPostApplication < ActiveRecord::Migration[6.1]
  def change
    create_table :job_post_applications do |t|
      t.integer :job_post_id
      t.integer :provider_id

      t.timestamps
    end
  end
end
