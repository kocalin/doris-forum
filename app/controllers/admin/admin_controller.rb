class Admin::AdminController < ApplicationController
  before_filter :require_is_admin
  def show
    @current = admin_root_path
  end

  def require_is_admin
    if !current_user.is_admin
	flash[:notice] = "您不是管理者"
	redirect_to forums_path
    end
  end
end
