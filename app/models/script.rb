class Script < ActiveRecord::Base
  belongs_to :creator, :class_name => "User"

  named_scope :with_domain, lambda {|domain|
    {:conditions => {:domain => domain}}
  }
end
