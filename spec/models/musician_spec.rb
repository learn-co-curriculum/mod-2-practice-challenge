require 'rails_helper'

RSpec.describe Musician, type: :model do
  name = 'Clancy'
  age = 32
  
  before(:each) do 
    @musician = Musician.create(age: age, name: name)
  end

  it 'has a name' do
    expect(@musician.name).to eq(name)
  end

  it 'has an age' do
    expect(@musician.age).to eq(age)
  end

  it 'has an id' do
    expect(@musician.id).not_to be_nil
  end

  it 'has many bands' do
    b1 = Band.create(name: 'xtc')
    b2 = Band.create(name: 'television')
    BandMember.create(band_id: b1.id, musician_id: @musician.id, instrument: 'guitar')
    BandMember.create(band_id: b2.id, musician_id: @musician.id, instrument: 'guitar')

    expect(@musician.bands.length).to eq(2)
  end
end
