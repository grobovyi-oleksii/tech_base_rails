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

  def set_default_index
    self.station_index ||= station_index(+1)
  end

  def update_position(route, index)
    station_route = station_route(route)
    station_route&.update(station_index: index)
  end

  def index(route)
    station_route(route)&.station_index
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
