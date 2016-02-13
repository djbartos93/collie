json.array!(@jobs) do |job|
  json.extract! job, :id, :progect, :box_number, :wire_number, :start_foot, :end_foot, :pulled_length, :jack_lock, :item_id, :qty_used
  json.url job_url(job, format: :json)
end
