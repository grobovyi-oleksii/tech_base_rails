class Train < ApplicationRecord
  validates :number, presence: true
  has_many :tickets
  has_many :carriages
  belongs_to :route
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id

  def business_carriages
    carriages.business
  end

  def eco_carriages
    carriages.eco
  end

  def business_count
    business_carriages.count
  end

  def eco_count
    eco_carriages.count
  end
end
