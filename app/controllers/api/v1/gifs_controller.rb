class Api::V1::GifsController < ApplicationController

  def index
    render json: GiphySerializer.new(Gifs.new(params[:location]))
  end
end
