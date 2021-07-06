class RailwayStation < ApplicationRecord
  validates :title, presence: true
  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  scope :ordered, lambda {
    select('railway_stations.*, railway_stations_routes.station_index')
      .joins(:railway_stations_routes)
      .order('railway_stations_routes.station_index').uniq
  }

  def update_position(route, index)
    station_route = station_route(route)
    station_route&.update(station_index: index)
  end

  def index(route)
    station_route(route)&.station_index
  end

  def arrival_time(route)
    station_route(route)&.arrival_time
  end

  def departure_time(route)
    station_route(route)&.departure_time
  end

  def update_datetime(route, arrival_time, departure_time)
    station_route = station_route(route)
    station_route&.update(arrival_time: arrival_time, departure_time: departure_time)
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
