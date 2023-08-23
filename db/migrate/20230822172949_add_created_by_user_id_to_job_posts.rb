class AddCreatedByUserIdToJobPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :job_posts, :created_by_user_id, :integer
  end
end
