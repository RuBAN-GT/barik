require 'barik/container'
require 'dry/transaction'

module Barik
  module Operations
    class CleanWorkflow
      include Dry::Transaction(container: Container)

      step :sign_in, with: 'sign_in'
      step :delete_items, with: 'delete_items'
    end
  end
end
