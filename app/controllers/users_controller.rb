class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = current_user
    @bookings = @user.bookings.includes(:court)
    @courts = @user.courts
  end
end
