json.set! :http_status_code, 200
json.set! :success, true
json.set! :message, t('jets.get.success')
json.data do
  json.jets do
    json.array! @jets do |jet|
      json.extract! jet, :id, :brand, :model, :type, :seats, :luggage_capacity, :classification, :price_per_hours, :range
      json.attachments do
        json.array! jet.attachments, :id, :full_original_asset_url, :full_medium_url, :full_thumb_url
      end
    end
  end
end
