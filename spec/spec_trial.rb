require_relative './spec_helper'
require_relative '../lib/scraper.rb'

describe "Scraper" do

  let(:scraper) {Scraper.new}

  describe "#get_page" do
    it "uses Nokogiri to get the HTML from a web page" do
      url = "https://www.petfinder.com/pet-search?location=63109&animal=cat&breed=&age=baby&distance=25"
      doc = scraper.get_page(url)
      expect{scraper.get_page}.to_not raise_error
      expect(doc).to be_a(Nokogiri::HTML::Document)
    end
  end


  describe "#get_picture_links" do
    it "uses a CSS selector to return an array of Nokogiri XML elements representing the html links I will be using to get to individual kitten profiles" do
      url = "https://www.petfinder.com/pet-search?location=63109&animal=cat&breed=&age=baby&distance=25"
      picture_links = scraper.get_picture_links(url)
      picture_links.each do |picture_link|
        expect(picture_link).to be_a(String)
        expect(picture_link).to include?("petdetail")
      end
    end
  end

end
