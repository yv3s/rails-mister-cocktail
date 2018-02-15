# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require  'open-uri'
require 'json'
require 'nokogiri'


p "Destroyinngg everythinnggggg"
Cocktail.destroy_all
Ingredient.destroy_all

p "Starting the seed"

url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
url_serialized = open(url).read
ingredients = JSON.parse(url_serialized)
ingredients["drinks"].each do |ingredient|
  ingr = ingredient.values.first
  p ingr
  img_url = "https://pixabay.com/en/photos/?q=#{ingr.gsub(" ", "+").gsub("ñ","n").gsub("ä","a")}&hp=&image_type=all&order=&cat=&min_width=&min_height="
  html_file = open(img_url).read
  html_doc = Nokogiri::HTML(html_file)
  if html_doc.search(".item img").empty?
    url_path = ""
  else
    url_path = html_doc.search(".item img").first["src"]
  end
  p url_path
  Ingredient.create(name: ingredient.values.first, url: url_path)
end





p "seed Over !"
