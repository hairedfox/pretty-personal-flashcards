class Card < ApplicationRecord
  belongs_to :user
  has_many :links
  has_one_attached :sound
end
