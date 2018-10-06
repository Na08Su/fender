# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# production => コマンドから直接登録することも検討
AdminUser.create!(email: 'koki0601@example.com', password: 'koki0601+', password_confirmation: 'koki0601+') if Rails.env.production?
AdminUser.create!(email: 'nattu0803@example.com', password: 'nattu0803+', password_confirmation: 'nattu0803+') if Rails.env.production?
AdminUser.create!(email: 'mikami0303@example.com', password: 'mikami0303+', password_confirmation: 'mikami0303+') if Rails.env.production?
AdminUser.create!(email: 'ryota0726@example.com', password: 'ryota0726+', password_confirmation: 'ryota0726+') if Rails.env.production?

AdminUser.create!(email: 'external@example.com', password: 'exterminator', password_confirmation: 'exterminator') if Rails.env.production?


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
