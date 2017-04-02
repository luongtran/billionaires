json.set! :http_status_code, 200
json.set! :success, true
json.set! :message, t('cars.booking.success')
json.data do
  json.extract! @booking, :id, :status, :pick_up_address, :pick_up_lat, :pick_up_lng, :chauffeur,
    :destination_address, :destination_lat, :destination_lng, :name, :surname, :street_address,
    :city, :state, :zip, :driver_licence, :bithrday, :state_license_was_issued, :insurance_carrier,
    :policy, :start_date, :end_date, :additional_information
end
