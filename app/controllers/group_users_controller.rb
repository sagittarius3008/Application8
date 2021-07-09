class GroupUsersController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    user = current_user
    @group.users << user
    redirect_to groups_path, notice: "ユーザーを追加しました。"
  end
  
  def destroy
    @group = Group.find(params[:group_id])
    # user = current_user
    # "-"が非破壊的メソッドだから反映されない！！！！
    @group = @group.users - [current_user]
    # @group.save
    redirect_to groups_path, notice: "ユーザーを削除しました。"
  end
end
