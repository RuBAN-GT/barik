require 'dry/monads'
require 'dry/transaction'
require 'barik/config'

module Barik
  module Operations
    # Sign in operation
    class SignIn
      include Dry::Transaction

      tee :open_home
      tee :open_sign_in_form
      tee :fill_the_sign_in_form
      tee :finalize_sign_in_form
      step :validate_result

      private

      def open_home(adapter)
        adapter.visit Barik::Config.home_url
      end

      def open_sign_in_form(adapter)
        adapter.click_on 'Войти'
      end

      def fill_the_sign_in_form(adapter)
        adapter.fill_in 'E-mail', id: 'LoginForm_username', with: Barik::Config.username
        adapter.fill_in 'Пароль', id: 'LoginForm_password', with: Barik::Config.password
      end

      def finalize_sign_in_form(adapter)
        adapter.click_button 'Войти'
      end

      def validate_result(adapter)
        error_summary = adapter.find_all('.errorSummary').first
        if error_summary.nil?
          Success adapter
        else
          Failure error_summary.text
        end
      end
    end
  end
end
