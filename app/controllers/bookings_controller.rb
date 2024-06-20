class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]

  def index
    @bookings = Booking.all
    @datexes = Datex.all
  end

  def show
    @datexes = Datex.all
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
      session[:notice] = 'Date booked!'
      redirect_to new_payment_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @datex = @booking.datex_id
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
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
