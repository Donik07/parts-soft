class CustomDevise::RegistrationsController < Devise::RegistrationsController
  def sign_up_params
    super.tap do |whitelisted|
      whitelisted[:api_token] = params[:user][:api_token]
    end
  end
end
