class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :film, foreign_key: true
      t.string :document_number
      t.string :email
      t.string :name
      t.string :phone
      t.timestamps
    end
  end
end
