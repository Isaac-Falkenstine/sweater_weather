class Api::V1::GifsController < ApplicationController

  def index
    render json: GiphySerializer.new(GifCollection.new(params[:location]))
  end
end
