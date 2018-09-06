# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?


categories = ["荒野行動", "ポケモン", "ドラクエ", "ウイイレ", "パワプロ", "FF", "桃鉄", "NIKE", "Puma", "Adidas"]

categories.each do |c|
  Category.create(name: c)
end

10.times do |d|
    Article.create(
        title: "タイトルタイトルタイトル#{d}",
        body: "テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト#{d}",
        category_id: rand(5) + 1
    )
end
