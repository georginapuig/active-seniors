require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "welcome" do
    mail = UserMailer.welcome
    assert_equal "Welcome", mail.subject
    assert_equal ["georginaxpuig@gmail.com"], mail.to
    assert_equal ["ignacio@codia.co"], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
