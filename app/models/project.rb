class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
end
