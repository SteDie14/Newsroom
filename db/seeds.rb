# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
RssSource.create!(
    :title => 'Google News  - Elektromotor',
    :url => 'http://news.google.com/news?hl=de&gl=de&authuser=0&q=elektromotor&um=1&ie=UTF-8&output=rss'
)