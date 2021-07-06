class Route < ActiveRecord::Base
  validates :name, presence: true
  has_many :trains
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes, dependent: :destroy
  validate :stations_count
  before_validation :set_name
  before_validation :set_default_index

  scope :ordered_railway_stations, -> { joins(:railway_stations_routes).order('railway_stations_routes.station_index') }
  scope :with_station, ->(station) { joins(:railway_stations).where('railway_stations.id = ?', station.id) }

  def self.find_routes(start_station, end_station)
    with_station(start_station) & with_station(end_station)
  end

  def first_station
    railway_stations.first
  end

  def last_station
    railway_stations.last
  end

  private

  def set_default_index
    railway_stations_routes.each.with_index do |station, index|
      station.station_index ||= index
    end
  end

  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end

  def stations_count
    errors.add(:base, 'Route must have minimum 2 station') if railway_stations.count > 2
  end
end
