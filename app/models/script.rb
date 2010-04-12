class Script < ActiveRecord::Base
  belongs_to :creator, :class_name => "User"

  named_scope :with_domain, lambda {|domain|
    {:conditions => {:domain => domain}}
  }

  before_create :set_guid

  private

  def set_guid
    self.guid = ActiveSupport::SecureRandom.hex(16)
  end
end
