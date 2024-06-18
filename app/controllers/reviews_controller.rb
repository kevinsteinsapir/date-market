class ReviewsController < ApplicationController
  before_action :set_datex, only: %i[new create destroy]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.datex = @datex
    if @review.save
      redirect_to datex_path(@datex), notice: "Review created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to datex_path(@datex), notice: "Review deleted successfully"
  end

  private

  def set_datex
    @datex = Datex.find(params[:datex_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
