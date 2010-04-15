require 'test_helper'

class NotificationsTest < ActiveSupport::TestCase
  context "Notifications" do
    should "send reset password" do
      Notifications.create_reset_password(Factory(:user))
    end

    should "send signup email" do
      Notifications.create_signup(Factory(:user))
    end
  end
end
