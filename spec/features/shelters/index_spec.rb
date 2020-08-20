require 'rails_helper'
require 'pry'
RSpec.describe "shelters index page" do
  before :each do
    @shelter_1 = Shelter.create(name: "Shelter Name 1", address: "5 Street st.",
    city: "Lakewood", state: "CO", zip: 80204)
    @shelter_2 = Shelter.create(name: "Shelter Name 2", address: "6 Street st.",
    city: "Denver", state: "CO", zip: 80204)
  end

    it "can see each shelter's name" do
      visit "/shelters"
    expect(page).to have_content(@shelter_1.name)
    expect(page).to have_content(@shelter_2.name)
    end

end
