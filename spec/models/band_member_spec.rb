require 'rails_helper'

RSpec.describe BandMember, type: :model do
  instrument = 'guitar'

  before(:each) do
    @band = Band.create(name: 'Cat Party')
    @musician = Musician.create(name: 'Kitty', age: 28)
    @band_member = BandMember.create(band_id: @band.id, musician_id: @musician.id, instrument: instrument)
  end

  it 'has a band_id' do
    expect(@band_member.band_id).to eq(@band.id)
  end

  it 'has a musician_id' do
    expect(@band_member.musician_id).to eq(@musician.id)
  end

  it 'has an instrument' do
    expect(@band_member.instrument).to eq(instrument)
  end

  it 'has an id' do
    expect(@band_member.id).not_to be_nil
  end

  it 'belongs to a band' do
    expect(@band_member.band).to eq(@band)
  end

  it 'belongs to a musician' do
    expect(@band_member.musician).to eq(@musician)
  end
end
