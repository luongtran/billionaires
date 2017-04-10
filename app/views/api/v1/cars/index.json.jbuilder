json.set! :http_status_code, 200
json.set! :success, true
json.set! :message, t('cars.get.success')
json.data do
  json.cars do
    json.array! @cars do |car|
      json.extract! car, :id, :brand, :model, :description, :type, :seats, :top_speed, :power, :engine, :daily_rental,
        :extra_price_per_mile, :fuel_on_city, :fuel_on_hightway, :deposit, :daily_miles
      json.attachments do
        json.array! car.attachments, :id, full_original_asset_url, :full_medium_url, :full_thumb_url
      end
    end
  end
end
