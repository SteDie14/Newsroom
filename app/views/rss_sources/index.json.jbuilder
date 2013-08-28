json.array!(@rss_sources) do |rss_source|
  json.extract! rss_source, :title, :url
  json.url rss_source_url(rss_source, format: :json)
end
