class Carriage < ActiveRecord::Base
  TYPES = %w[CoupeCarriage CvCarriage EcoCarriage SeatCarriage].freeze
  validates :type, :number, presence: true
  validates :number, uniqueness: { scope: :train_id }
  belongs_to :train

  before_validation :set_number

  def set_number
    self.number ||= last_number + 1
  end

  protected

  def last_number
    train.carriages.pluck(:number).max || 0
  end

end
