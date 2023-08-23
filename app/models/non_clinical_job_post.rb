class NonClinicalJobPost < ApplicationRecord

  belongs_to :vendor
  has_many :non_clinical_job_applications

  def applied?(provider)
    self.non_clinical_job_applications.where(provider: provider).exists?
  end

  def apply!(provider)
    ncja = self.non_clinical_job_applications.create(provider: provider)
    Mailbox.new(provider, ncja).send_message_to(self.vendor, "I want to apply!", ncja)
  end

end
