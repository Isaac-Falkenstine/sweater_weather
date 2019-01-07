class Api::V1::FavoritesController < ApplicationController

  def create
    user = User.find_by(api_key: params[:api_key])

    favorite = Favorite.create(location: params[:location], user_id: user.id)
    favorite.save
  end
end
