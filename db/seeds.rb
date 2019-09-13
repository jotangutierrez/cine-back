# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

film1 = Film.create!(name: "Capitana Marvel",
                     description: "Película increible",
                     start_date: "2019-09-12",
                     end_date: "2019-09-19",
                     cover_url: "https://vignette.wikia.nocookie.net/disneyypixar/images/1/1a/Captain_Marvel_poster_2_Espa%C3%B1ol.jpg/revision/latest?cb=20190205013643&path-prefix=es"
)

film2 = Film.create!(name: "Wonder woman",
                     description: "Película emocionante",
                     start_date: "2019-09-13",
                     end_date: "2019-09-20",
                     cover_url: "https://cdn11.bigcommerce.com/s-0kvv9/images/stencil/1280x1280/products/291750/410799/apiesmg8k__93827.1553544863.jpg?c=2&imbypass=on"
)