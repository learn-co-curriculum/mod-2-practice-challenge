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
end
