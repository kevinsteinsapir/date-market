class DatexesController < ApplicationController
  before_action :set_datex, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def index
    search_bar
    if params[:search] && params[:search][:category].present?
      @datexes = Datex.where(category: params[:search][:category])
    else
      @datexes = Datex.all
    end

    @markers = @datexes.geocoded.map do |datex|
      {
        lat: datex.latitude,
        lng: datex.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { datex: datex }),
        marker_html: render_to_string(partial: "marker", locals: { datex: datex })
      }
    end
  end

  def show
    @review = Review.new
    @reviews = Review.where(datex: @datex)
    @review_average = @reviews.average(:rating)
    @marker = {
      lat: @datex.latitude,
      lng: @datex.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: { datex: @datex }),
      marker_html: render_to_string(partial: "marker", locals: { datex: @datex })
    }
  end

  def new
    @datex = Datex.new
  end

  def create
    @datex = Datex.new(datex_params)
    @datex.user = current_user
    if @datex.save
      redirect_to datex_path(@datex), notice: "Datex created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @datex.update(datex_params)
      redirect_to datex_path(@datex), notice: "Datex updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @datex.destroy
    redirect_to datexes_path, notice: "Datex deleted successfully!"
  end

  private

  def set_datex
    @datex = Datex.find(params[:id])
  end

  def datex_params
    params.require(:datex).permit(:title, :content, :visibility, :address, :price, :guests, :category, :photo)
  end

  def search_bar
    @datexes = Datex.all
    @datexes = @datexes.search(params[:query]) if params[:query].present?
    @datexes = @datexes.where(category: params[:search][:category]) if params[:search] && params[:search][:category].present?
  end
end
