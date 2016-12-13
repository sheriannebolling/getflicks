class Review < ApplicationRecord
  validates_presence_of :rating
  validates_inclusion_of :rating, in: 1..5
  validates_uniqueness_of :user_id, scope: :movie_id

  belongs_to :user
  belongs_to :movie
end
