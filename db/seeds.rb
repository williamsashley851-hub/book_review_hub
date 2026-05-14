# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'net/http'
require 'json'
require 'uri'

def fetch_books(query)
  url = "https://openlibrary.org/search.json?q=#{URI.encode_www_form_component(query)}&limit=10"
  uri = URI(url)
  response = Net::HTTP.get(uri)
  JSON.parse(response)
 
end
# Fantasy books
data = fetch_books("fantasy fiction")
data['docs'].each do |book|
  title = book['title']
  author = book['author_name']&.first || "Unknown"
  genre = "Fantasy"
  description = "No description available."

  Book.find_or_create_by!(title: title) do |b|
    b.author = author
    b.genre = genre
    b.description = description
  end
end
  # Horror books
data = fetch_books("horror fiction")
data['docs'].each do |book|
  title = book['title']
  author = book['author_name']&.first || "Unknown"
  genre = "Horror"
  description = "No description available."

  Book.find_or_create_by!(title: title) do |b|
    b.author = author
    b.genre = genre
    b.description = description
  end
end
  # Thriller books
data = fetch_books("thriller fiction")
data['docs'].each do |book|
  title = book['title']
  author = book['author_name']&.first || "Unknown"
  genre = "Thriller"
  description = "No description available."

  Book.find_or_create_by!(title: title) do |b|
    b.author = author
    b.genre = genre
    b.description = description
  end
end
  # Autobiography books
data = fetch_books("autobiography")
data['docs'].each do |book|
  title = book['title']
  author = book['author_name']&.first || "Unknown"
  genre = "Autobiography"
  description = "No description available."

  Book.find_or_create_by!(title: title) do |b|
    b.author = author
    b.genre = genre
    b.description = description
  end
end
  # Romance books
data = fetch_books("romance fiction")
data['docs'].each do |book|
  title = book['title']
  author = book['author_name']&.first || "Unknown"
  genre = "Romance"
  description = "No description available."

  Book.find_or_create_by!(title: title) do |b|
    b.author = author
    b.genre = genre
    b.description = description
  end
end