require 'rails_helper'

describe 'index page' do
  it 'has an h1 element containing Bands' do
    visit '/bands'

    expect(page).to have_content('Bands')
  end

  it 'has a list of bands' do
    Band.create(name: 'Test One')
    Band.create(name: 'Test Two')

    visit '/bands'

    expect(page).to have_content('Test One')
    expect(page).to have_content('Test Two')
  end

  it 'links to each band\'s show page' do
    band = Band.create(name: 'Test One')
    visit '/bands'

    expect(page).to have_link('Test One', href: band_path(band))
  end
end
