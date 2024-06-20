class PaymentsController < ApplicationController
  def new
  end

  def create
    flash[:notice] = "Payment has been successfully processed!"
    flash[:notice] = session.delete(:notice)
    redirect_to some_path
  end
end
