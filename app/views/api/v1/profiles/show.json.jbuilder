json.set! :http_status_code, 200
json.set! :message, t('profiles.get.success')
json.data do
  json.extract! current_user, :id, :name, :surname, :email, :role
end
