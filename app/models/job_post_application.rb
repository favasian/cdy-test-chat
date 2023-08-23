class JobPostApplication < ApplicationRecord

  belongs_to :job_post
  belongs_to :provider
  has_many :chat_messages, class_name: 'Chat::Message', as: :about

  def about_name
    self.job_post.name
  end

  def about_object
    self.job_post
  end

end
