require_relative "boot"

require "rails/all"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    config.load_defaults 7.0
    config.i18n.default_locale = :ja
    config.api_only = true

    # Autoload
    config.autoload_paths += %W[#{config.root}/lib]

    # GraphiQLを使用する為に必要
    # https://daido.hatenablog.jp/entry/2020/05/06/143145
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore
    config.middleware.use ActionDispatch::ContentSecurityPolicy::Middleware
  end
end
