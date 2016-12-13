class User < ApplicationRecord
  has_secure_password

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :username, :email, presence: true, uniqueness: true
  validates_format_of :email, with: EMAIL_REGEX, on: :create
  validates_length_of :password, in: 6..20, on: :create

  has_many :reviews
  has_many :favorites
  has_many :favorite_movies, through: :favorites, source: :movie
  has_many :reviewed_movies, through: :reviews, source: :movie
end
