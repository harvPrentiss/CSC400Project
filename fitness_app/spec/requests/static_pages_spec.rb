require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
  	it "should have the content 'Pulse Fitness'" do
  		visit '/static_pages/home'
  		expect(page).to have_content('Pulse Fitness')
  	end
    it "should have the base_title" do
      visit '/static_pages/home'
      expect(page).to have_title("Pulse Fitness")
    end
  end

  describe "Help page" do
  	it "should have the content 'Help" do
  		visit '/static_pages/help'
  		expect(page).to have_content('Help')
  	end
    it "should have the title" do
      visit '/static_pages/home'
      expect(page).to have_title("Pulse Fitness")
    end
  end

  describe "About page" do
    it "should have the content 'About'" do
      visit '/static_pages/about'
      expect(page).to have_content('About')
    end
    it "should have the title" do
      visit '/static_pages/home'
      expect(page).to have_title("Pulse Fitness")
    end
  end
end

