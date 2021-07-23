class CarriagesController < ApplicationController
  before_action :set_carriage, only: %i[edit update destroy show]

  def new
    @carriage = Carriage.new
  end

  def show; end

  def edit; end

  def create
    @carriage = Carriage.new(carriage_params)

    if @carriage.save
      redirect_to trains_url
    else
      render :new
    end
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to trains_url
    else
      redirect_to edit
    end
  end

  def destroy
    @carriage.destroy
    redirect_to routes_url
  end

  private

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def carriage_params
    params.require(:carriage).permit(:type, :top_seats, :bottom_seats, :train_id, :side_bottom_seats, :side_top_seats, :eco_seats)
  end
end
