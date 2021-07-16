class TicketsController < ApplicationController
  before_action :set_train, only: %i[create new]

  def show
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
    return unless RailwayStation.exists?(params[:start_station]) && RailwayStation.exists?(params[:end_station])

    @start_station = RailwayStation.find(params[:start_station])
    @end_station = RailwayStation.find(params[:end_station])
  end

  def create
    @ticket = @train.tickets.new(ticket_params)
    @ticket.user = User.first
    return redirect_to new_train_ticket_path(@train), notice: 'Something wrong' unless @ticket.save

    redirect_to ticket_path(@train), notice: 'Ticket was created!'
  end

  private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def ticket_params
    params.require(:ticket).permit(:first_name_user, :last_name_user, :passport_user, :base_station_id, :end_station_id)
  end

end
