class DatexesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :set_datex, only: %i[show edit update destroy]

  def index
    @datexes = Datex.all
  end

  def show
  end

  def new
    @datex = Datex.new
  end

  def create
    @datex = Datex.new(datex_params)
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
    params.require(:datex).permit(:title, :content, :visibility, :address, :price, :guests, :category)
  end
end
