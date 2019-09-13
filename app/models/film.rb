class Film < ApplicationRecord
  has_many :reservations

  def self.for_date(date)
    where("start_date <= ? and ? <= end_date", date, date)
  end

  validates_presence_of :name, :description, :start_date, :end_date, :cover_url

  def as_json(options = {})
    h = super(options)
    if options[:available_seats_for]
      h[:available_seats] = 10 - reservations.today.count
    end
    h
  end
end
