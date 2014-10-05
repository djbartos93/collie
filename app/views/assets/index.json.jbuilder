json.array!(@assets) do |asset|
  json.extract! asset, :id, :asset_tag, :asset_name, :serial_number, :purchase_date, :cost, :status, :notes
  json.url asset_url(asset, format: :json)
end
