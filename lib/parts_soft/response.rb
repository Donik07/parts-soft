# frozen_string_literal: true

module PartsSoft
  class Response
    def initialize(response)
      @response = response
    end
    attr_reader :response

    def body
      @body ||= JSON.parse(@response.body)
    rescue JSON::ParserError
      @body ||= @response.body
    end

    def fetch(*args)
      path = args.map(&:to_s)
      body.dig(*path)
    rescue StandardError
      nil
    end

    def success?
      response.status == 200
    rescue StandardError
      false
    end
  end
end
