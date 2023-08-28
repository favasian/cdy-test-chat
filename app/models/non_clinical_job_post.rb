class NonClinicalJobPost < ApplicationRecord

  belongs_to :vendor
  has_many :non_clinical_job_applications, dependent: :destroy
  has_many :chat_messages, through: :non_clinical_job_applications
  has_many :chats, through: :chat_messages

  def applied?(provider)
    self.non_clinical_job_applications.where(provider: provider).exists?
  end

  def apply!(provider)
    ncja = self.non_clinical_job_applications.create(provider: provider)
    Mailbox.new(provider, ncja).send_message_to(self.vendor, "I want to apply!", ncja)
  end

end
