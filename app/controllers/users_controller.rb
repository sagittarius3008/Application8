class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:update]
  # logged_inメソッドのために持ってきた。メソッドはapplication.controllerにあり。
  # before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  # →→→users_helperにlogged_in?入れた。チュートリアルの9.8参照

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      @user = current_user
      redirect_to user_path(@user.id)
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      @books = @user.books
      render "edit"
    end
  end
  
  # kaminariが必要？
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  # def destroy
  #   User.find(params[:id]).destroy
  #   flash[:success] = "User deleted"
  #   redirect_to users_url
  # end

  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
  
end
