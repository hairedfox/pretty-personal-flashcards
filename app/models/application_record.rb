# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def method_missing(method_name, *_args)
    klass_name = self.class.name
    "#{klass_name}Presenter".constantize.new(self).public_send(method_name)
  end

  def respond_to_missing?(name, include_private = false)
    super
  end
end
