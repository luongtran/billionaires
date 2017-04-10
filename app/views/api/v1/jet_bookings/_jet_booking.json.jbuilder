json.extract! jet_booking, :id, :departure_city, :arrival_city, :departure_date, :return_date
json.jet do
	json.extract! jet_booking.jet, :id, :brand, :model, :type, :seats, :luggage_capacity, :classification, :price_per_hours, :range 
end