class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end


  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])

    if @booking.update(booking_params)
      redirect_to @booking
    else
      render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to bookings_url
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :beginning_time, :ending_time, :court_id, :user_id)
  end
end
