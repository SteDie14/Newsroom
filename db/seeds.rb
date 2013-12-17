# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if RssSource.count == 0
  RssSource.create!(
      :title => 'Google News  - Elektromotor',
      :url => 'http://news.google.com/news?hl=de&gl=de&authuser=0&q=elektromotor&um=1&ie=UTF-8&output=rss'
  )
end

if User.count == 0
  User.create!(
      :email => "bernhard.zuern@googlemail.com",
      :password => "demo12345",
      :password_confirmation => "demo12345"
  )
end
