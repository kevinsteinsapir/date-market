class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @datex = Datex.find(params[:datex_id])
    @booking = Booking.new
  end

  def create
    @datex = Datex.find(params[:datex_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.datex = @datex
    if @booking.save
      redirect_to root_path, notice: 'Date booked!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    raise
    @booking = Booking.find(params[:datex_id])
    
  end

  def updated
  end

  def delete
  end

  private

  def booking_params
    params.require(:booking).permit(:fecha)
  end
end
