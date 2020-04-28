require 'rails_helper'

RSpec.describe Band, type: :model do
  name = 'Jambo'

  before(:each) do 
    @band = Band.create(name: name)
  end

  it 'has a name' do
    expect(@band.name).to eq(name)
  end

  it 'has an id' do
    expect(@band.id).not_to be_nil
  end

  it 'has many musicians' do
    m1 = Musician.create(name: 'jam', age: 5)
    m2 = Musician.create(name: 'ham', age: 50)
    BandMember.create(band_id: @band.id, musician_id: m1.id, instrument: 'drums')
    BandMember.create(band_id: @band.id, musician_id: m2.id, instrument: 'guitar')

    expect(@band.musicians.length).to eq(2)
  end
end
