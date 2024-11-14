class Review < ApplicationRecord
  belongs_to :project
  validates :rating, presence: true
  validates :comment, presence: true
end
