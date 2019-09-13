class Reservation < ApplicationRecord
  belongs_to :film

  validate :available_capacity
  validate :on_billboard

  def on_billboard
    unless (film.start_date..film.end_date).cover? self.reservation_date
      errors.add(:out_billboard, "La película no se encuentra en cartelera para la fecha solicitada")
    end
  end

  def available_capacity
    if film.reservations.where(reservation_date: reservation_date).count >= 10
      errors.add(:max_load, "No se pueden realizar mas reservas para la funcion del día solicitado")
    end
  end

  def as_json(options = {})
    {
      id: id,
      film_id: film_id,
      document_number: document_number,
      email: email,
      name: name,
      phone: phone,
      created_at: created_at,
      updated_at: created_at,
      film_name: film.name,
      reservation_date: reservation_date
    }
  end
end
