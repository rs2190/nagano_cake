require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NaganoCake
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # [Add] 2023/02/26 Railsアプリケーション日本語対応（国際化【i18n】)
    config.i18n.default_locale = :ja

    # [Add] 2023/03/19 システム日付を日本時間に設定
    config.time_zone = 'Tokyo'

  end
end
