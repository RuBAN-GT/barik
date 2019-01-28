################
# Dependencies
################

# Boot
require_relative 'boot'

# Project
require 'barik/browser'
require 'barik/operations/clean_workflow'

################
# Run!
################

browser = Barik::Browser.new(:chrome)

transaction = Barik::Operations::CleanWorkflow.new
transaction.call(browser.session) do |m|
  m.success do |result|
    puts "All is ok: #{result}"
  end

  m.failure do |error|
    puts "Some is wrong: #{error}"
  end
end
