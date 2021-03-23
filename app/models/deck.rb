class Deck < ApplicationRecord
  belongs_to :user
  has_many :links
  has_many :cards, through: :links
  has_one_attached :image
end
