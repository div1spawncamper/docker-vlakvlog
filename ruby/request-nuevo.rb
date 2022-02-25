require 'nokogiri'
require 'open-uri'

last_value = ''
last_value1 = ''

def fetch_value(user_id, last_value)
  page = Nokogiri::HTML(URI.open("https://www.mediavida.com/id/#{user_id}"))
  value = page.at("//ul[@class = 'user-meta']/li[3]").text.gsub(/\s+/, "")
  if value != last_value
    open("#{user_id}.csv", 'a') do |f|
      f.puts "#{Time.now.strftime("%d %b %Y - %H:%M:%S")},#{value},#{elapsed_time}"
    end
  end
  value
end

while true
  value = fetch_value("Bullet_AZ", last_value)
  last_value = value
  sleep(2) 
  value1 = fetch_value("doogie780", last_value1)
  last_value1 = value1 
  sleep(2)
end


