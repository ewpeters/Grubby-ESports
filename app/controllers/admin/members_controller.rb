class Admin::MembersController < Admin::ApplicationController
  before_filter :find_group

  def create
    @user = User.find_by_login!(params[:user])
    @group.users << @user unless @group.users.include?(@user)
    flash[:notice] = t(:has_been_placed_into, :user => @user.to_s, :group => @group.to_s)
  rescue ActiveRecord::RecordNotFound
    flash[:notice] = t(:not_found, :thing => "user")
  ensure
    redirect_to admin_group_users_path(@group)
  end

  def destroy
    Rails.logger.info(params[:group_id])
    @user = User.find_by_login!(params[:id])
    if @user && @group
      new_users = @group.users - [@user]
      @group.users = new_users
      if @group.save
        flash[:notice] = "User removed"
        redirect_to admin_group_users_path(@group)
      else
        flash[:notice] = "User not removed - error"
        redirect_to admin_group_users_path(@group)
      end
    else
        flash[:notice] = "User not found"
        redirect_to admin_group_users_path(@group)
    end
  end

  private
  def find_group
    @group = Group.find(params[:group_id])
  rescue ActiveRecord::RecordNotFound
    flash[:notice] = t(:not_found, :thing => "group")
    redirect_back_or_default admin_groups_path
  end
end
