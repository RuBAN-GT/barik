# frozen_string_literal: true

require 'dry/monads'
require 'dry/transaction'

module Barik
  module Operations
    # Delete items from profile
    class DeleteItems
      include Dry::Transaction

      tee :open_profile_page
      tee :handle_list

      private

      def open_profile_page(adapter)
        adapter.first('.nav-wrapper li:last-of-type').hover.click_link(text: /Мой список/)
      end

      def handle_list(adapter)
        handle_list_rec adapter
      end

      def handle_list_rec(adapter)
        begin
          item = adapter.first('.m-animelist-item')
        rescue StandardError
          return adapter
        end

        handle_item adapter, item
        adapter.refresh
        handle_list_rec adapter
      end

      def handle_item(adapter, item)
        item.first('[data-name=pos]').click

        form_group = adapter.find('form#yw0')
        form_group.find('#UsersRates_episodes').tap do |input|
          current_value = input[:value].to_i || 0
          max_value     = input[:max].to_i || 0
          fill_value    = current_value == max_value ? max_value - 1 : max_value

          input.fill_in with: fill_value
        end
        form_group.find('.s6.input-field').tap do |status_group|
          status_group.find('input').click
          status_group.find('li:last-of-type').click
        end

        form_group.click_button 'Сохранить'
      end
    end
  end
end
