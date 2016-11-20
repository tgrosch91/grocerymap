require_relative './spec_helper'
require_relative '../lib/scraper.rb'

describe "Scraper" do

  let(:scraper) {Scraper.new}

  describe "#get_individual_links" do
    it "uses a CSS selector to return an array of Nokogiri XML elements representing the html links I will be using to get to individual kitten profiles" do
      url = "http://theshelterpetproject.org/search?location=63109&animal=cat&breed=&sex=&size=&age=&offset=0&count=16&page=1"
      links = scraper.get_individual_links(url)
      expect(links).to be_a(Array)
      links.each do |link|
        expect(link).to be_a(String)
      end
    end
  end

  describe "#get_kitten_info" do
    it "uses a CSS selectors to return a hash of attributes for each individual kitten page" do
      url = "http://theshelterpetproject.org/pet?id=16655758"
      hash = scraper.get_kitten_info(url)
      expect(hash).to be_a(Hash)
    end
  end

end
