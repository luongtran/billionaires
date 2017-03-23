json.set! :http_status_code, 200
json.set! :success, true
json.set! :message, t('jets.get.success')
json.data do
  json.jets do
    json.array! @jets do |jet|
      json.extract! jet, :id, :brand, :model, :type, :seats, :luggage_capacity, :classification, :price_per_hours, :range
      json.attachments do
        json.array! jet.attachments, :id, :original_url, :medium_url, :thumb_url
      end
    end
  end
end
