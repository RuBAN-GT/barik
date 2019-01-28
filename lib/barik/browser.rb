# frozen_string_literal: true

require 'capybara'
require 'capybara/poltergeist'

module Barik
  # The session wrapper over capybara
  class Browser
    attr_reader :session

    def initialize(driver = :poltergeist)
      @session = ::Capybara::Session.new(driver)
      set_default_window_size
    end

    def set_default_window_size
      session.driver.browser.manage.window.resize_to(1905, 850)
    rescue StandardError
      p 'Can not change window size'
    end
  end
end
