# frozen_string_literal: true

class Deck < ApplicationRecord
  include Discard::Model

  belongs_to :user
  has_many :links
  has_many :cards, through: :links
  has_one_attached :cover, dependent: :purge_now

  validates :name, presence: true
end
