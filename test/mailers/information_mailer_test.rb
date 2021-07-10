require 'test_helper'

class InformationMailerTest < ActionMailer::TestCase
  test "received_email" do
    mail = InformationMailer.received_email
    assert_equal "Received email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
