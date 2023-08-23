class JobPost < ApplicationRecord

  belongs_to :owner
  belongs_to :created_by_user, class_name: 'User', optional: true
  has_many :job_post_applications
  has_many :chat_messages, through: :job_post_applications
  has_many :chats, through: :chat_messages

  def created_by_recruiter?
    !!self.created_by_user&.recruiter?
  end

  def applied?(provider)
    self.job_post_applications.where(provider: provider).exists?
  end

  def apply!(provider)
    jpa = self.job_post_applications.create(provider: provider)
    if self.created_by_user&.recruiter?
      Mailbox.new(provider, jpa).send_message_to(self.owner.account, "I want to apply!", jpa)
    else
      Mailbox.new(provider, jpa).send_message_to(self.owner, "I want to apply!", jpa)
    end
  end
end
