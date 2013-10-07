json.array!(@folders) do |folder|
  json.extract! folder, :title
  json.url folder_url(folder, format: :json)
end
