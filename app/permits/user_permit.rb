# frozen_string_literal: true

class UserPermit < Permit
  def fields
    %i[email api_token]
  end
end
