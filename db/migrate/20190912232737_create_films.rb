class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.string :name
      t.text :description
      t.string :cover_url
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
