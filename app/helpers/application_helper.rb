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

  private

  def javascript_exists?(script)
    script = "#{Rails.root}/app/javascript/#{script}.js"
    File.exists?(script) || File.exists?("#{script}.coffee") 
  end
end
