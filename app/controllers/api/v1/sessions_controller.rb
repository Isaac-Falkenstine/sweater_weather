class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])

    if user
      render json: UserSerializer.new(user)
    else
      render json: "ERROR D:"
    end
  end
end
