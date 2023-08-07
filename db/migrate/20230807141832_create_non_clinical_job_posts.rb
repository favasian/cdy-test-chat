class CreateNonClinicalJobPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :non_clinical_job_posts do |t|
      t.integer :vendor_id
      t.string :name

      t.timestamps
    end
  end
end
