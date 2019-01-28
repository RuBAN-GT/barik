module Barik
  # Simple config
  module Config
    class << self
      def home_url
        'https://smotretanime.ru/'
      end

      def username
        ENV['SESSION_USERNAME']
      end

      def password
        ENV['SESSION_PASSWORD']
      end
    end
  end
end
