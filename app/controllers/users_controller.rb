class UsersController < ApplicationController
  before_action :set_user
  before_action :ensure_is_admin, only: [:index]

  def index
    @users = User.all
  end

  private


  def ensure_is_admin
    (redirect_to root_path, notice: %Q[<a href="/users/index">/users/admin</a> accessible only by an admin]) unless @user && @user.is_admin?
  end

  def set_user
    @user = User.find_by(private_id: params[:id])
  end

end
