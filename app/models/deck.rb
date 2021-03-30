# frozen_string_literal: true

class Deck < ApplicationRecord
  belongs_to :user
  has_many :links, dependent: :destroy
  has_many :cards, through: :links
  has_one_attached :cover
end
