require 'barik/operations/sign_in'
require 'barik/operations/delete_items'
require 'dry/container'

module Barik
  # Container of components
  class Container
    extend Dry::Container::Mixin

    register(:sign_in) { Barik::Operations::SignIn.new }
    register(:delete_items) { Barik::Operations::DeleteItems.new }
  end
end
