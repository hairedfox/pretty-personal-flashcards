# frozen_string_literal: true

class BaseDecorator
  attr_reader :obj

  def initialize(obj)
    @obj = obj
  end

  def method_missing(method_name, *args)
    return obj.public_send(method_name, *args) unless block_given?

    yield
  end

  def respond_to_missing?(method_name, include_private = false)
    super
  end
end
