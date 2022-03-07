class User < ApplicationRecord
  has_many :discussions, dependent: :destroy
  has_many :posts, dependent: :destroy
end