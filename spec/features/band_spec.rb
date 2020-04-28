require 'rails_helper'

describe 'index page' do
  before(:each) do
    @band1 = Band.create(name: 'Test One')
    @band2 = Band.create(name: 'Test Two')

    visit '/bands'
  end

  it 'has an h1 element containing Bands' do
    expect(page).to have_content('Bands')
  end

  it 'has a list of bands' do
    expect(page).to have_content(@band1.name)
    expect(page).to have_content(@band2.name)
  end

  it 'links to each band\'s show page' do
    expect(page).to have_link(@band1.name, href: band_path(@band1))
    expect(page).to have_link(@band2.name, href: band_path(@band2))
  end
end
