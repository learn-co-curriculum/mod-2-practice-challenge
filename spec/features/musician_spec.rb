require 'rails_helper'

describe 'musician features' do
  context 'index page' do
    before(:each) do
      @m1 = Musician.create(name: 'Test One', age: 50)
      @m2 = Musician.create(name: 'Test Two', age: 39)
  
      visit '/musicians'
    end
  
    it 'has an h1 element containing Musicians' do
      expect(page).to have_content('Musicians')
    end
  
    it 'has a list of musicians' do
      expect(page).to have_content(@m1.name)
      expect(page).to have_content(@m2.name)
    end
  
    it 'links to each musician\'s show page' do
      expect(page).to have_link(@m1.name, href: musician_path(@m1))
      expect(page).to have_link(@m2.name, href: musician_path(@m2))
    end
  end
  
  context 'show page' do
    before(:each) do
      @band1 = Band.create(name: 'Test One')
      @band2 = Band.create(name: 'Test Two')
      @band3 = Band.create(name: 'Test Three')
      @m1 = Musician.create(name: 'A', age: 10)
      @bm1 = BandMember.create(band_id: @band1.id, musician_id: @m1.id, instrument: 'guitar')
      @bm2 = BandMember.create(band_id: @band2.id, musician_id: @m1.id, instrument: 'drums')
      @bm3 = BandMember.create(band_id: @band3.id, musician_id: @m1.id, instrument: 'bass')
        
      visit musician_path(@m1)
    end
  
    it 'displays the musician name' do
      expect(page).to have_content(@m1.name)
    end

    it 'displays the musician age' do
      expect(page).to have_content(@m1.age)
    end
  
    it 'links to each band show page that the musician is in' do
      expect(page).to have_link(@band1.name, href: band_path(@band1))
      expect(page).to have_link(@band2.name, href: band_path(@band2))
      expect(page).to have_link(@band3.name, href: band_path(@band3))
    end
  end

  context 'ADVANCED: index page' do
    it 'orders the musicians by the number of bands they are in from most to least' do
      band1 = Band.create(name: 'Test One')
      band2 = Band.create(name: 'Test Two')
      band3 = Band.create(name: 'Test Three')
      m1 = Musician.create(name: 'A', age: 10)
      m2 = Musician.create(name: 'B', age: 20)
      m3 = Musician.create(name: 'C', age: 30)
      [band1, band2, band3].each do |band|
        BandMember.create(band_id: band.id, musician_id: m2.id, instrument: 'drums')
      end
      [band2, band3].each do |band|
        BandMember.create(band_id: band.id, musician_id: m1.id, instrument: 'guitar')
      end
      [band3].each do |band|
        BandMember.create(band_id: band.id, musician_id: m3.id, instrument: 'oboe')
      end
        
      visit musicians_path

      expect(page).to have_content("#{m2.name} #{m1.name} #{m3.name}")
    end
  end
end
