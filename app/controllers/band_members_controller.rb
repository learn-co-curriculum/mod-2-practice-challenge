class BandMembersController < ApplicationController
  def new
    @band_member = BandMember.new
  end

  def create
    @band_member = BandMember.new(band_member_params)

    if @band_member.save
      redirect_to band_path(@band_member.band)
    else
      render :new
    end
  end

  private
  
  def band_member_params
    params.require(:band_member).permit(:band_id, :musician_id, :instrument)
  end
end