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
[
  "The Name of the Wind Patrick Rothfuss",
  "A Game of Thrones George R.R. Martin",
  "The Hobbit J.R.R. Tolkien",
  "Mistborn Brandon Sanderson",
  "The Way of Kings Brandon Sanderson",
  "American Gods Neil Gaiman",
  "The Night Circus Erin Morgenstern",
  "Stardust Neil Gaiman",
  "The Lies of Locke Lamora Scott Lynch",
  "Eragon Christopher Paolini"
].each do |query|
  data = fetch_books(query)
  book = data['docs'].first
  next unless book

  Book.find_or_create_by!(title: book['title']) do |b|
    b.author = book['author_name']&.first || "Unknown"
    b.genre = "Fantasy"
    b.description = "No description available."
  end
end

  # Horror books
[
  "It Stephen King",
  "The Shining Stephen King",
  "Dracula Bram Stoker",
  "Frankenstein Mary Shelley",
  "The Haunting of Hill House Shirley Jackson",
  "Bird Box Josh Malerman",
  "The Silence of the Lambs Thomas Harris",
  "House of Leaves Mark Z. Danielewski",
  "Pet Sematary Stephen King",
  "Sharp Objects Gillian Flynn"
].each do |query|
  data = fetch_books(query)
  book = data['docs'].first
  next unless book

  Book.find_or_create_by!(title: book['title']) do |b|
    b.author = book['author_name']&.first || "Unknown"
    b.genre = "Horror"
    b.description = "No description available."
  end
end
  # Thriller books
[
  "Gone Girl Gillian Flynn",
  "The Girl with the Dragon Tattoo Stieg Larsson",
  "The Da Vinci Code Dan Brown",
  "The Girl on the Train Paula Hawkins",
  "Behind Closed Doors B.A. Paris",
  "The Woman in the Window A.J. Finn",
  "Verity Colleen Hoover",
  "The Silent Patient Alex Michaelides",
  "Big Little Lies Liane Moriarty",
  "In the Woods Tana French"
].each do |query|
  data = fetch_books(query)
  book = data['docs'].first
  next unless book

  Book.find_or_create_by!(title: book['title']) do |b|
    b.author = book['author_name']&.first || "Unknown"
    b.genre = "Thriller"
    b.description = "No description available."
  end
end
  # Autobiography books
[
  "The Diary of a Young Girl Anne Frank",
  "Long Walk to Freedom Nelson Mandela",
  "I Know Why the Caged Bird Sings Maya Angelou",
  "Becoming Michelle Obama",
  "The Story of My Experiments with Truth Mahatma Gandhi",
  "Open Andre Agassi",
  "Born a Crime Trevor Noah",
  "Educated Tara Westover",
  "Me Talk Pretty One Day David Sedaris",
  "Just Kids Patti Smith"
].each do |query|
  data = fetch_books(query)
  book = data['docs'].first
  next unless book

  Book.find_or_create_by!(title: book['title']) do |b|
    b.author = book['author_name']&.first || "Unknown"
    b.genre = "Autobiography"
    b.description = "No description available."
  end
end
  # Romance books
[
  "Pride and Prejudice Jane Austen",
  "Outlander Diana Gabaldon",
  "The Notebook Nicholas Sparks",
  "Me Before You Jojo Moyes",
  "The Hating Game Sally Thorne",
  "It Ends with Us Colleen Hoover",
  "The Kiss Quotient Helen Hoang",
  "Beach Read Emily Henry",
  "The Spanish Love Deception Elena Armas",
  "People We Meet on Vacation Emily Henry"
].each do |query|
  data = fetch_books(query)
  book = data['docs'].first
  next unless book

  Book.find_or_create_by!(title: book['title']) do |b|
    b.author = book['author_name']&.first || "Unknown"
    b.genre = "Romance"
    b.description = "No description available."
  end
end