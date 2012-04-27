#!/usr/bin/env ruby
require 'nokogiri'
require 'awesome_print'
require 'thor'
require 'net/http'
require 'uri'
require 'active_support/time'


class App < Thor
  include Net
  desc "get", "get document from the web"
  def get 
    puts HTTP.get_response(uri)
  end 
end


file = 'xml/SMS.xml'
data = IO.readlines(file)
puts  data
exit
doc = Nokogiri::XML(data)
header =  doc.xpath '//table//tr[position()=1]'
column_keys = header.xpath('td').map {|td| td.text()}
ap column_keys

data = doc.xpath '//table//tr[position()>1]'
first_row = data.first.xpath('td').map {|td| td.text()}

column_keys.each_with_index do |key, index|
  ap  "#{key}:  #{first_row[index]}"
end
