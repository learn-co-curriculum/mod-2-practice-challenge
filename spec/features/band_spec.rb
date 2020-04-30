require 'rails_helper'

describe 'band features' do
  context 'index page' do
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
  
  context 'show page' do
    before(:each) do
      @band = Band.create(name: 'Test One')
      @m1 = Musician.create(name: 'A', age: 10)
      @m2 = Musician.create(name: 'B', age: 11)
      @m3 = Musician.create(name: 'C', age: 13)
      @bm1 = BandMember.create(band_id: @band.id, musician_id: @m1.id, instrument: 'guitar')
      @bm2 = BandMember.create(band_id: @band.id, musician_id: @m2.id, instrument: 'drums')
      @bm3 = BandMember.create(band_id: @band.id, musician_id: @m3.id, instrument: 'bass')
      band2 = Band.create(name: 'Dummy')
      BandMember.create(band_id: band2.id, musician_id: @m1.id, instrument: 'oboe')
  
      visit band_path(@band)
    end

    it 'displays the band name' do
      expect(page).to have_content(@band.name)
    end

    it 'links to each band member musician\'s show page' do
      expect(page).to have_link(@m1.name, href: musician_path(@m1))
      expect(page).to have_link(@m2.name, href: musician_path(@m2))
      expect(page).to have_link(@m3.name, href: musician_path(@m3))
    end

    it 'displays the instrument played by each musician' do
      expect(page).to have_content(@bm1.instrument)
      expect(page).to have_content(@bm2.instrument)
      expect(page).to have_content(@bm3.instrument)
    end
  end

  context 'ADVANCED: show page' do
    before(:each) do
      @band = Band.create(name: 'Test One')
      @m1 = Musician.create(name: 'A', age: 10)
      @m2 = Musician.create(name: 'B', age: 30)
      @m3 = Musician.create(name: 'C', age: 20)
      @bm1 = BandMember.create(band_id: @band.id, musician_id: @m1.id, instrument: 'guitar')
      @bm2 = BandMember.create(band_id: @band.id, musician_id: @m2.id, instrument: 'drums')
      @bm3 = BandMember.create(band_id: @band.id, musician_id: @m3.id, instrument: 'bass')

      visit band_path(@band)
    end

    it 'displays the average age (mean) of all band members' do
      expect(page).to have_content('Average age: 20')
    end

    it 'orders the musicians by age' do
      expect(page).to have_content("#{@m2.name} #{@bm2.instrument} #{@m3.name} #{@bm3.instrument} #{@m1.name} #{@bm1.instrument}")
    end
  end
end
