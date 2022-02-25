#!/usr/bin/ruby
require 'nokogiri'
require 'open-uri'


page = Nokogiri::HTML(URI.open("https://www.mediavida.com/id/Bullet_AZ")) 
puts page.at("//ul[@class = 'user-meta']/li[3]").text.gsub(/\s+/, "")