require 'cucumber/rails'
require "capybara/cuprite"
require "cuprite/downloads/cucumber"
require 'capybara-screenshot/cucumber' unless ENV["CI"]

Capybara.register_driver(:cuprite) do |app|
  Capybara::Cuprite::Driver.new(app, {
    window_size: [1200, 2048],
    timeout: 20,
    js_errors: true,
    headless: true,
  })
end

Capybara.server = :puma, { Silent: true }
Capybara.default_driver = :cuprite
Capybara.default_normalize_ws = true

# Capybara defaults to CSS3 selectors rather than XPath.
# If you'd prefer to use XPath, just uncomment this line and adjust any
# selectors in your step definitions to use the XPath syntax.
# Capybara.default_selector = :xpath

# By default, any exception happening in your Rails application will bubble up
# to Cucumber so that your scenario will fail. This is a different from how 
# your application behaves in the production environment, where an error page will 
# be rendered instead.
#
# Sometimes we want to override this default behaviour and allow Rails to rescue
# exceptions and display an error page (just like when the app is running in production).
# Typical scenarios where you want to do this is when you test your error pages.
# There are two ways to allow Rails to rescue exceptions:
#
# 1) Tag your scenario (or feature) with @allow-rescue
#
# 2) Set the value below to true. Beware that doing this globally is not
# recommended as it will mask a lot of errors for you!
#
ActionController::Base.allow_rescue = false

I18n.enforce_available_locales = false

