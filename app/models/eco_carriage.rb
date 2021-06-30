class EcoCarriage < Carriage
  validates :top_seats, :bottom_seats, :side_bottom_seats, :side_top_seats, presence: true
end