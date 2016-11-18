require_relative './spec_helper'
require_relative '../lib/scraper.rb'

describe "Scraper" do

  let(:scraper) {Scraper.new}

  describe "#get_page" do
    it "uses Nokogiri to get the HTML from a web page" do
      doc = scraper.get_page
      expect{scraper.get_page}.to_not raise_error
      expect(doc).to be_a(Nokogiri::HTML::Document)
    end
  end


  describe "#get_picture_links" do
    it "uses a CSS selector to return an array of Nokogiri XML elements representing the html links I will be using to get to individual kitten profiles" do
      picture_links = scraper.get_picture_links
      picture_links.each do |picture_link|
        expect(picture_link).to be_a(String)
        expect(picture_link).to include?("petdetail")
      end
    end
  end

end
