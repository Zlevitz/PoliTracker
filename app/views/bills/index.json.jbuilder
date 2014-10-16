json.array!(@bills) do |bill|
  json.extract! bill, :id, :description
  json.url bill_url(bill, format: :json)
end
