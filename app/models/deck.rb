# frozen_string_literal: true

class Deck < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  has_many :links
  has_many :cards, through: :links
  has_one_attached :cover

  validates :name, presence: true
end
