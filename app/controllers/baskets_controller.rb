class BasketsController < ApplicationController
  before_action :get_api_key

  def index
    response = PartsSoft::Commands::Baskets.new(:get, @api_key).call

    @collection = response.fetch(:data) if response.success?
  end

  def send_to_basket
    return if params[:oem].blank? || params[:api_hash].blank?

    response = PartsSoft::Commands::Baskets.new(
      :post,
      @api_key,
      qnt: params[:qnt],
      oem: params[:oem],
      detail_name: params[:detail_name],
      api_hash: params[:api_hash],
    ).call

    redirect_to baskets_index_path if response.success?
  end

  def clear_basket
    response = PartsSoft::Commands::BasketsClear.new(:post, @api_key).call

    redirect_to baskets_index_path if response.success?
  end

  protected

  def get_api_key
    @api_key = current_user.api_token
  end
end
