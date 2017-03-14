json.set! :http_status_code, 200
json.set! :success, true
json.set! :message, t('cars.booking.success')
json.data do
  json.extract! @booking, :id, :status
end
