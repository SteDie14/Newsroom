json.array!(@news_items) do |news_item|
  json.extract! news_item, :release_date, :vendor, :headline, :topic, :keywords, :web_url, :doc_url, :comment, :RssSource_id
  json.url news_item_url(news_item, format: :json)
end
