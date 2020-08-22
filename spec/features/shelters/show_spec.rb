require 'rails_helper'
require 'pry'
RSpec.describe 'shelters index page' do
  before :each do
    @shelter_1 = Shelter.create(name: 'Shelter Name 1', address: '5 Street st.',
                                city: 'Lakewood', state: 'CO', zip: 80_204)
  end

  it "can see the shelter's name and address" do
    visit "/shelters/#{@shelter_1.id}"
    expect(page).to have_content(@shelter_1.name)
    expect(page).to have_content(@shelter_1.address)
    expect(page).to have_content(@shelter_1.city)
    expect(page).to have_content(@shelter_1.state)
    expect(page).to have_content(@shelter_1.zip)
  end
end
