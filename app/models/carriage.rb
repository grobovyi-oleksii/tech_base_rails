class Carriage < ActiveRecord::Base
  validates :kind, :bottom_seats, :top_seats, presence: true
  belongs_to :train

  enum kind: %i[eco business]

end
