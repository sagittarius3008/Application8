class InformationsController < ApplicationController
  def new
    @information = Information.new
  end
  
  def create
    InformationMailer.send_mail_users
    redirect_to information_confirm_path
  end
  
  def confirm
  end

  private

  def information_params
    params.require(:information).permit(:title, :content)
  end
  
end
