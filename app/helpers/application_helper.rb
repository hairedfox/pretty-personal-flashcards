# frozen_string_literal: true

module ApplicationHelper
  def footer_copyright_year
    Time.current.year == 2021 ? 'present' : 2021
  end
end
