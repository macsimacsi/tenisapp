class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = current_user
    @bookings = @user.bookings.includes(:court)
    @courts = @user.courts
  end

  def destroy
    @user = current_user
    @user.destroy
    sign_out @user
    redirect_to root_path, notice: "Your account has been successfully deleted."
  end
end
