# frozen_string_literal: true

class DeckPresenter < SimpleDelegator
  include ActionView::Helpers::TagHelper

  def status
    self.deleted? ?
      tag.span("inactive", class: "badge badge-secondary") :
      tag.span("active", class: "badge badge-success")
  end
end
