require 'rails_helper'
require 'pry'
RSpec.describe "shelters index page" do
  before :each do
    @shelter_1 = Shelter.create(name: "Shelter Name 1")
    @shelter_2 = Shelter.create(name: "Shelter Name 2")
  end

  describe 'it in more details' do
    it "I see each shelter's name" do
      visit "/shelters"
    expect(page).to have_content(@shelter_1.name)
    expect(page).to have_content(@shelter_2.name)
    end
  end
