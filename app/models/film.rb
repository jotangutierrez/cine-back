class Film < ApplicationRecord
  has_many :reservations

  def self.for_date(date)
    where("start_date <= ? and ? <= end_date", date, date)
  end

  validates_presence_of :name, :description, :start_date, :end_date, :cover_url

  def as_json(options = {})
    h = super(options)
    if options[:available_seats_for].present?
      occupied = reservations.where(reservation_date: options[:available_seats_for]).count
      h[:available_seats] = 10 - occupied
    end
    h
  end
end
