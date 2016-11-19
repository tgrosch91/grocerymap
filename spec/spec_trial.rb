require_relative './spec_helper'
require_relative '../lib/individual_link_scraper.rb'

describe "Scraper" do

  let(:scraper) {Scraper.new}

  describe "#get_individual_links" do
    it "uses a CSS selector to return an array of Nokogiri XML elements representing the html links I will be using to get to individual kitten profiles" do
      url = "http://theshelterpetproject.org/search?location=63109&animal=cat&breed=&sex=&size=&age=&offset=0&count=16&page=1"
      links = scraper.get_individual_links(url)
      links.each do |link|
        expect(link).to be_a(String)
        expect(link).to include?("pet?id")
      end
    end
  end

end
