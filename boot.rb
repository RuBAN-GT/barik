# Global dep
require 'bundler/setup'
require 'dotenv/load'

# Load libs into path
$LOAD_PATH << Pathname.pwd.join('lib')

# Initializers
root_path = File.dirname(__FILE__)
Dir["#{root_path}/initializers/*.rb"].each { |f| require(f) }

# Basic
require 'barik'
