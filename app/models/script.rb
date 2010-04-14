class Script < ActiveRecord::Base
  belongs_to :creator, :class_name => "User"

  named_scope :with_domain, lambda {|domain|
    {:conditions => {:domain => domain}}
  }

  before_create :set_guid

  def to_param
    "#{id}-#{title.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-').sub(/^-/,'').sub(/-$/,'')
  end

  private

  def set_guid
    self.guid = ActiveSupport::SecureRandom.hex(16)
  end
end
