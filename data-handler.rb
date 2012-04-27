require 'nokogiri'
require 'open-uri'
require 'pry'

def capture_data
  doc = Nokogiri::XML(open('http://www.hydrodaten.admin.ch/lhg/SMS.xml'))
  #f = File.open("xml/SMS.xml")
  #doc = Nokogiri::XML(f)

  data = doc.xpath('//MesPar')

  datar = []

  data.each do |d| 

    if d.attribute('Typ').value == '03'

      names = d.css('Name').text.split(' - ')
      name = names[0]
      station_name = names[1]
      date = d.css('Datum').text
      time = d.css('Zeit').text
      value = d.css('Wert').first.text

      datar.push(name: name, station_name: station_name, date: date, time: time, value: value)

    else
    end
    end

    datar
end

def get_rivers
  datar = capture_data
  rivers = []
  datar.each { |a| rivers.push(a[:name]) }
  rivers.uniq
end

def get_stations
  datar = capture_data
  stations = []
  datar.each { |s| stations.push(river: s[:name], station_name: s[:station_name]) }
  stations
end
