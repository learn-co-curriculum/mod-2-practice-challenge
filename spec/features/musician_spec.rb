require 'rails_helper'

describe 'index page' do
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
