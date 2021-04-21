# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def method_missing(method_name, *args)
    klass_name = self.class.name
    "#{klass_name}Presenter".constantize.new(self).public_send(method_name)
  end
end
