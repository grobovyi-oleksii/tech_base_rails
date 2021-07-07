class Train < ApplicationRecord
  validates :number, presence: true
  has_many :tickets
  has_many :carriages
  belongs_to :route
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id

  def business_count
    carriages.business.count
  end

  def eco_count
    carriages.eco.count
  end
end
