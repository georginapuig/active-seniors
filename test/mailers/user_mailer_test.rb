require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "welcome" do
    mail = UserMailer.welcome
    assert_equal "Welcome", mail.subject
    assert_equal ["georginaxpuig@gmail.com"], mail.to
    assert_equal ["ignacio@codia.co"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  # postmark
  # def hello
  #   mail(
  #     :subject => 'Hello from Postmark',
  #     :to  => 'georginaxpuig@gmail.com',
  #     :from => 'ignacio@codia.co',
  #     :html_body => '<strong>Hello</strong> dear Postmark user.',
  #     :track_opens => 'true'
  #   )
  # end
end
