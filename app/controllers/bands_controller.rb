class BandsController < ApplicationController
  def index
    @bands = Band.all
  end

  def show
    @band = Band.find_by_id(params[:id])
  end
end