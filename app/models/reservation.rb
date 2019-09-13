class Reservation < ApplicationRecord
  belongs_to :film

  validate :available_capacity
  validate :on_billboard

  scope :today, -> { where(created_at: Date.today.all_day) }

  def on_billboard
    unless (film.start_date..film.end_date).cover? Date.today
      errors.add(:out_billboard, "La película no se encuentra en cartelera en este momento")
    end
  end

  def available_capacity
    if film.reservations.today.count > 10
      errors.add(:max_load, "No se pueden realizar mas reservas para esta función")
    end
  end

  def as_json(options = {})
    h = super(options)
    h[:film_name] = film.name
    h
  end
end
