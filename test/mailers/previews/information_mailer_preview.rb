# Preview all emails at http://localhost:3000/rails/mailers/information_mailer
class InformationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/information_mailer/received_email
  def received_email
    InformationMailer.received_email
  end

end
