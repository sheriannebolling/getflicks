# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# mel = User.create(username: "mel", email: "sadgirl@gmail.com", password: "password")
# jaws = Movie.create(genre: "comedy", title: "jaws", year: "1989", director: "tom", cast: "some guys", plot: "sharks")
# fave1 = Favorite.create(user_id: 1, movie_id: 1)
# review1 = Review.create(user_id: 1, movie_id: 1, comment: "idk", rating: 3)
# rate2 = Review.create(user_id: 1, movie_id: 1, comment: "lol", rating: 5)
base_id = "0107289"
1000.times do |time|
  id = base_id.to_i
  id += time
  request = "http://www.omdbapi.com/?i=tt0#{id.to_s}"
  query = open(request).read
  response = JSON.parse(query)
  p response
  unless response["Response"] == "False"
    Movie.create(genre: response["Genre"].split(", ").first, title: response["Title"], year: response["Year"], director: response["Director"], cast: response["Actors"], plot: response["Plot"], poster: response["Poster"])
  end
end
