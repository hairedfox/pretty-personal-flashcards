# frozen_string_literal: true

class Link < ApplicationRecord
  belongs_to :deck
  belongs_to :card
end
