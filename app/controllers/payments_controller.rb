class PaymentsController < ApplicationController
  before_action :set_datex_and_booking, only: %i[new create]
  def new
  end

  def create
    flash[:notice] = "Payment has been successfully processed!"
    redirect_to booking_path(@booking)
  end

  private

  def set_datex_and_booking
    @datex = Datex.find(params[:datex_id])
    @booking = Booking.find(params[:booking_id])
  end
end
