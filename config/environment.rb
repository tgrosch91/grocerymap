require 'bundler'
Bundler.require

require 'pry'
require 'nokogiri'
require 'open-uri'


require_relative '../lib/cat.rb'
require_relative '../lib/scraper.rb'
require_relative '../lib/concerns/cattributes.rb'


require_all 'lib'
