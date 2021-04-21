# frozen_string_literal: true

class DeckPresenter < SimpleDelegator
  include ActionView::Helpers::TagHelper

  def status
    if discarded?
      tag.span('inactive', class: 'badge badge-secondary')
    else
      tag.span('active', class: 'badge badge-success')
    end
  end
end
