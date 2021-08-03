class SearchesController < ApplicationController
  def show
    @stations = RailwayStation.all
  end

  def search
    unless RailwayStation.exists?(params[:start_station]) && RailwayStation.exists?(params[:end_station])
      return redirect_to search_path
    end
    @start_station = RailwayStation.find(params[:start_station])
    @end_station = RailwayStation.find(params[:end_station])
    @routes = Route.find_routes(@start_station, @end_station)
  end
end
