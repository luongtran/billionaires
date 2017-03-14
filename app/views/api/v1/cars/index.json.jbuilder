json.set! :http_status_code, 200
json.set! :success, true
json.set! :message, t('cars.get.success')
json.data do
  json.cars do
    json.array! @cars, :id, :brand, :model, :type, :seats, :top_speed, :power, :engine, :daily_rental,
      :extra_price_per_mile, :fuel_on_city, :fuel_on_hightway, :deposit, :daily_miles
  end
end
