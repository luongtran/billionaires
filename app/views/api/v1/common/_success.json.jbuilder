json.set! :http_status_code, 200
json.set! :message, message
json.extract! user, :id, :name, :surname, :email, :role
