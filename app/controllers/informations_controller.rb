class InformationsController < ApplicationController
  def new
    @information = Information.new
  end
  
  def create
  end
  
  def confirm
  end
  
  def send_mail
    SampleMailer.send_mail_users
    redirect_to information_confirm_path
  end 
  
  private

  def information_params
    params.require(:information).permit(:title, :content)
  end
  
end
