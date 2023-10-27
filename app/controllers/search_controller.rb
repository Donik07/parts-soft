class SearchController < ApplicationController
  def index
    if params[:q].present? && !params[:q].empty?
      @search = SearchService.new(
        params.slice(:q, :brand).merge(user_id: current_user.id).to_unsafe_h
      ).search
    end

    render 'search/index'
  end
end
