class Review < ApplicationRecord
  validates_presence_of :rating
  validates_inclusion_of :rating, in: 1..5

  belongs_to :user
  belongs_to :movie
end
