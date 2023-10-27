# frozen_string_literal: true

class Permit
  class AuthValueError < StandardError
  end

  def initialize(user)
    @user = user
  end

  # @param [ActionController::Parameters] params
  # @param [Symbol] mode
  # @return [ActionController::Parameters]
  def permit(params, mode = :all)
    return if params.blank?

    params.permit(*send(mode))
  end

  def fields
    []
  end

  def all
    [*fields]
  end
end
