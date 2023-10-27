# frozen_string_literal: true

class SearchService
  def initialize(*args)
    options = args.extract_options!

    @number  = options[:q]
    @brand   = options[:brand]
    @user_id = options[:user_id]
  end

  def search
    response =
      if @brand.present?
        PartsSoft::Commands::GetOffersByOemAndMakeName.new(:get, api_key, oem: @number, make_name: @brand).call
      else
        PartsSoft::Commands::GetBrandsByOem.new(:get, api_key, oem: @number).call
      end

    response.fetch(:data) if response.success?
  end

  protected

  def api_key
    User.find_by_id(@user_id)&.api_token
  end
end
