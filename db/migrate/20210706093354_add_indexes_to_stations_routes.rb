class AddIndexesToStationsRoutes < ActiveRecord::Migration[6.1]
  def change
    add_index :railway_stations_routes, :route_id
    add_index :railway_stations_routes, :railway_station_id
  end
end
