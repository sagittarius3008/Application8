class InformationMailer < ApplicationMailer
  
  def send_mail(user)
    @user = user
    @information = information
    mail(subject: '#{@information.content}',to: user.email, from: "test@example.com")
  end 
  
  def self.send_mail_users
    @users = User.all
    @users.each do |user|
      SampleMailer.send_mail(user).deliver_now
    end 
  end 
  
  # def send_mail
  #   SampleMailer.send_mail_users
  #   redirect_to groups_path
  # end 
  
  # def self.send_mail_users
  #   @information = Information.new(information_params)
  #   if @information.save
  #     render "confirm"
  #   else
  #     render :new
  #   end
  # end


end
