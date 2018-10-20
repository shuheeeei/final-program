require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FinalProgram
  class Application < Rails::Application
    config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.test_framework false
    end
    config.i18n.default_locale = :ja
    config.action_view.field_error_proc = proc { |input, instance| input }
    config.active_record.default_timezone = :ja
    config.time_zone = 'Tokyo'
  end
end

Time::DATE_FORMATS[:default] = '%Y/%m/%d %H:%M'
