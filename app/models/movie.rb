class Movie < ApplicationRecord
  validates_presence_of :genre, :title, :year, :director, :cast, :plot

  has_many :favorites
  has_many :reviews
  has_many :fans, through: :favorites, source: :user

  def average_rating
    sum = 0
    self.reviews.each { |review| sum += review.rating }
    sum.to_f / self.reviews.count
  end
end
