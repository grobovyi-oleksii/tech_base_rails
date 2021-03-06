class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :train
  belongs_to :base_station, class_name: 'RailwayStation', foreign_key: :base_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id

  after_create :send_buy_notification

  after_destroy :send_cancel_notification

  def route_name
    "#{base_station.title} - #{end_station.title}"
  end

  def send_buy_notification
    TicketsMailer.buy_ticket(user, self).deliver_now
  end

  def send_cancel_notification
    TicketsMailer.cancel_ticket(user, self).deliver_now
  end
end
