class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_train, only: %i[create new]
  before_action :set_ticket, only: %i[show destroy]

  def show
  end

  def index
    @tickets = current_user.tickets
  end

  def new
    @ticket = Ticket.new
    @start_station = RailwayStation.find(params[:start_station])
    @end_station = RailwayStation.find(params[:end_station])

  end

  def create
    @ticket = @train.tickets.new(ticket_params)
    @ticket.user = current_user
    if @ticket.save
      redirect_to tickets_path, notice: 'Ticket was created!'
    else
      redirect_to new_train_ticket_path(@train), notice: 'Something wrong'
    end
  end

  def destroy
    redirect_to tickets_path if @ticket.destroy
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  def ticket_params
    params.require(:ticket).permit(:first_name_user, :last_name_user, :passport_user, :base_station_id, :end_station_id)
  end

end
