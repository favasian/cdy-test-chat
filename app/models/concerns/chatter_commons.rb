module ChatterCommons
  extend ActiveSupport::Concern


  included do
    has_many :chat_members, as: :chatter
  end

end
