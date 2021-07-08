class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end
  
  def create
    @group = Group.new(group_params)
    @group.owner_id =current_user.id
    @group.users << current_user
    if @group.save
      redirect_to groups_path,notice: "You have created group successfully."
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def new
    @group = Group.new
  end
  
  def edit
    @group = Group.find(params[:id])
    if @group.owner_id == current_user.id
      render "edit"
    else
      redirect_to groups_path
    end
  end
  
  def show
    @group = Group.find(params[:id])
    # UserGroupテーブルからログインユーザーと、詳細を表示しているグループの組み合わせを探します。
    # 組み合わせがなければnilを返します。
    @groupUser = GroupUser.find_by(user_id: current_user.id, group_id: params[:id])
  end
  
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end
  
  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path(@group), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end
  
  private
  def group_params
    params.require(:group).permit(:name,:introduction,:image)
  end
  
end
