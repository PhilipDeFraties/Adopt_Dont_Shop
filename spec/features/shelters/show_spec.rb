require 'rails_helper'
require 'pry'
RSpec.describe "shelters index page" do
  before :each do
    @shelter_1 = Shelter.create(name: "Shelter Name 1", address: "5 Street st.",
    city: "Lakewood", state: "CO", zip: 80204)
    @shelter_2 = Shelter.create(name: "Shelter Name 2", address: "6 Street st.",
    city: "Denver", state: "CO", zip: 80204)
  end

  it "can see shelter_1's name and address" do
    visit "/shelters/#{@shelter_1.id}"
  expect(page).to have_content(@shelter_1.name)
  expect(page).to have_content(@shelter_1.address)
  expect(page).to have_content(@shelter_1.city)
  expect(page).to have_content(@shelter_1.state)
  expect(page).to have_content(@shelter_1.zip)
  end
  it "can see shelter_2's name and address" do
    visit "shelters/#{@shelter_2.id}"
  expect(page).to have_content(@shelter_2.name)
  expect(page).to have_content(@shelter_2.address)
  expect(page).to have_content(@shelter_2.city)
  expect(page).to have_content(@shelter_2.state)
  expect(page).to have_content(@shelter_2.zip)
  end
end
