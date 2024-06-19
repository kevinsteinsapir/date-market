class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]

  def index
    @bookings = Booking.all
  end

  def show
    raise
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
    @datex = @booking.datex_id
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(booking)
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:fecha)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
