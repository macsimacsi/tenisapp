class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @court = Court.find(params[:court_id])
    @user = current_user
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @court = Court.find(params[:court_id])
    @booking.court = @court

    if @booking.save
      redirect_to court_path(@court), notice: 'Booking was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @booking.user = current_user
    @court = Court.find(params[:court_id])
  end

  def update
    @booking = Booking.find(params[:id])

    if @booking.update(booking_params)
      redirect_to profile_path, notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @booking.user = current_user
    @court = Court.find(params[:court_id])
    @booking = Booking.find(params[:id])
    if @booking.destroy
      redirect_to profile, notice: 'Booking was successfully deleted'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :beginning_time, :ending_time, :court_id, :user_id)
  end
end
