require 'test_helper'
require 'mocha/test_unit'

class UserTest < ActiveSupport::TestCase
  test "user is admin user" do
    user = User.where(is_admin: true).first
    assert user.is_admin_user
  end

  test "user is not admin user" do
    user = User.where(is_admin: false).first
    assert_not user.is_admin_user
  end

  test "failed sending e-mail to user" do
    # Testing user sent mail correctly would be testing rails mailers.
    user = User.first
    UserMailer.expects(:welcome_email).returns(true)
    assert_equal user.send_email, UserMailer::ERROR_MESSAGE
  end
end
