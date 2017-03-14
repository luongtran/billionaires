json.set! :http_status_code, 200
json.set! :success, true
json.set! :message, t('jets.get.success')
json.data do
  json.jets do
    json.array! @jets, :id, :brand, :model, :type, :seats
  end
end
