# frozen_string_literal: true

module PartsSoft
  class Commands
    def initialize(method, api_key, params = nil)
      @method = method
      @api_key = api_key
      @params = params || {}
    end
    attr_reader :params

    def call
      sign! if need_sign?
      response = request_builder.call(@method, name, @params)

      Response.new(response)
    end

    protected

    def need_sign?
      true
    end

    def without_cross
      false
    end

    def request_builder
      @request ||= PartsSoft::Request.new
    end

    def sign!
      @params[:api_key] = @api_key
      @params[:without_cross] = true if without_cross
    end
  end
end
