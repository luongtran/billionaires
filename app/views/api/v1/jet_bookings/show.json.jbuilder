json.set! :http_status_code, 200
json.set! :success, true
json.set! :message, "Jet has booked successfully"
json.jet_booking do
	json.partial! "jet_booking", jet_booking: @jet_booking
end
