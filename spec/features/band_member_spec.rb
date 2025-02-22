require 'rails_helper'

describe 'new band member features' do
  instrument = 'guitar'

  before(:each) do
    @band1 = Band.create(name: 'Blarb')
    @m1 = Musician.create(name: 'a', age: 30)
    @m2 = Musician.create(name: 'b', age: 32)
    @band2 = Band.create(name: 'Grarb')

    visit 'band_members/new'
  end

  def create_member(instrument)
    select @band1.name, from: 'band_member_band_id'
    select @m1.name, from: 'band_member_musician_id'
    fill_in 'band_member_instrument', with: instrument
    click_button 'commit'
  end

  it 'selects a band name from a dropdown' do
    expect(page).to have_select(id: 'band_member_band_id')
  end

  it 'selects a musician name from a dropdown' do
    expect(page).to have_select(id: 'band_member_musician_id')
  end

  it 'allows the user to type in an instrument' do
    expect(page).to have_field(id: 'band_member_instrument')
  end

  it 'creates a new band member' do
    create_member(instrument)

    expect(BandMember.last.band_id).to eq(@band1.id)
    expect(BandMember.last.musician_id).to eq(@m1.id)
    expect(BandMember.last.instrument).to eq(instrument)
  end

  it 'redirects to the band show page for that band member' do
    create_member(instrument)

    expect(page.current_path).to eq(band_path(@band1))
  end

  it 'displays an error if instrument does not have at least 3 characters' do
    create_member('b')

    expect(page).to have_content('Instrument is too short (minimum is 3 characters)')
  end

  it 'displays an error if a musician is being added to the same band again' do
    BandMember.create(band_id: @band1.id, musician_id: @m1.id, instrument: instrument)
    create_member(instrument)

    expect(page).to have_content('Musician can only be listed in the same band once')
  end
end