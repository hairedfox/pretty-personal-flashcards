class Deck < ApplicationRecord
  belongs_to :user
  has_many :links
  has_many :cards, through: :links
end
