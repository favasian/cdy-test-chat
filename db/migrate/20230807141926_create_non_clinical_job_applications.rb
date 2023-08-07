class CreateNonClinicalJobApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :non_clinical_job_applications do |t|
      t.integer :non_clinical_job_post_id
      t.integer :provider_id

      t.timestamps
    end
  end
end
