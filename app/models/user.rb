class User < ActiveRecord::Base
  acts_as_authentic

  before_validation_on_create :reset_password

  has_many :scripts

  attr_accessible :display_name, :email

  def display_name
    if super.blank?
      "Anonymous#{id}"
    else
      super
    end
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifications.deliver_reset_password(self)
  end
end
