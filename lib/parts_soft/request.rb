# frozen_string_literal: true

require 'http'

module PartsSoft
  class Request
    ENDPOINT = 'https://ohmyparts.ru'

    def call(method, command, params)
      url = build_endpoint(command)

      case method
      when :get
        client.get(url, params: params)
      else
        client.post(url, params: params)
      end
    end

    def client
      HTTP::Client.new(headers: default_headers)
    end

    def default_headers
      # some headers params
    end

    protected

    def build_endpoint(command)
      endpoint =
        if command == :baskets
          ENDPOINT + '/api/v1'
        else
          ENDPOINT + '/backend/price_items/api/v1/search'
        end
      endpoint + '/' + command.to_s
    end
  end
end
