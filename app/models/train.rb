class Train < ApplicationRecord
  validates :number, presence: true
  has_many :tickets
  has_many :carriages, ->(train) { order("number #{train.order_carriage ? 'ASC' : 'DESC'}") }
  belongs_to :route
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id

  def number_of_seats_by_type(carriage_type, seats_type)
    carriages.where(type: carriage_type).sum(seats_type)
  end
end
