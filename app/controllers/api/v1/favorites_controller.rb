class Api::V1::FavoritesController < ApplicationController

  def create
    user = User.find_by(api_key: params[:api_key])

    if user
      favorite = Favorite.create(location: params[:location], user_id: user.id)
    else
      render json: { error: "Unauthorized" }, status: 401
    end
  end

  def index
    user = User.find_by(api_key: params[:api_key])
    binding.pry
    render json: user.favorites_json
  end
end
