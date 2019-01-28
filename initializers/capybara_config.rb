require 'capybara'
require 'pathname'

# @see https://www.rubydoc.info/github/jnicklas/capybara/Capybara.configure
Capybara.configure do |config|
  config.default_driver = :selenium
  config.save_path = Pathname.pwd.join('..', 'tmp')
end
