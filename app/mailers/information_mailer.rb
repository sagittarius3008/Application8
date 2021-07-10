class InformationMailer < ApplicationMailer
  
  def send_mail
    SampleMailer.send_mail_users
    redirect_to groups_path
  end 
  
  def self.send_mail_users
    @information = Information.new(inquiry_params)
    if @inquiry.save
      render "confirm"
    else
      render :new
    end
  end


end
