class User < ActiveRecord::Base
  acts_as_authentic

  before_validation_on_create :reset_password

  has_many :scripts

  def display_name
    if super.blank?
      "Anonymous#{id}"
    else
      super
    end
  end
end
