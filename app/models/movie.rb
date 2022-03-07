class Movie < ApplicationRecord
  has_many :discussions, dependent: :destroy
  validates :title, uniqueness: true
end
