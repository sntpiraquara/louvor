# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(name: 'Neri Junior', email: 'neri@nerijunior.com', password: '123qwe')
Music.create!(name: 'Grande é o Senhor', author: 'Adhemar de Campos',
              lyrics: "Grande é o Senhor\nE mui digno de louvor\nNa cidade do nosso Deus\nSeu Santo monte\nAlegria de toda terra\n\nGrande é o Senhor\nEm quem nós temos a vitória\nQue nos ajuda\nContra o inimigo\nPor isso diante Dele\nNos prostramos\n\nQueremos o Teu nome engrandecer\nE agradecer-Te\nPor tua obra em nossa vida\nConfiamos em Teu infinito amor\nPois só Tu és o Deus eterno\nSobre toda terra e Céus\n\nQueremos o Teu nome engrandecer\nE agradecer-Te\nPor tua obra em nossa vida\nConfiamos em Teu infinito amor\nPois só Tu és o Deus eterno\nSobre toda terra e Céus")
