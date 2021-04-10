# frozen_string_literal: true

module ApplicationHelper
  def footer_copyright_year
    Time.current.year == 2021 ? 'present' : 2021
  end

  def controller_stylesheet(options = { media: 'all' })
    path = File.join(controller_path, action_name)
    stylesheet_link_tag(path, options) if Rails.application.assets.find_asset(path)
  end

  def controller_javascript(options = {})
    path = "#{controller_path}/#{action_name}"
    javascript_pack_tag(path, options) if javascript_exists?(path)
  end

  def present(obj, method_name, *args)
    presenter_name = "#{obj.class.name}Decorator"
    presenter = Object.const_defined?(presenter_name) ? presenter_name.constantize : BaseDecorator
    presenter.new(object).public_send(method_name, *args)
  end

  private

  def javascript_exists?(script)
    script = "#{Rails.root}/app/javascript/#{script}.js"
    File.exist?(script) || File.exist?("#{script}.coffee")
  end
end
