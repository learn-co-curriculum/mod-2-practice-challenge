class MusiciansController < ApplicationController
  def index
    @musicians = Musician.order_by_band_number
  end

  def show
    @musician = Musician.find_by_id(params[:id])
  end
end