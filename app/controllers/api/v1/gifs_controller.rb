class Api::V1::GifsController < ApplicationController

  def index
    render json: GiphySerializer.new(Gif.new(params[:location]))
  end
end
