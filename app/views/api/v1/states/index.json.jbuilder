json.set! :http_status_code, 200
json.set! :success, true
json.set! :message, t('states.get.success')
json.data do
  json.states do
    json.array! @states do |state|
      json.id state.id
      json.name state.name
      json.cities do
        json.array! state.cities, :id, :name
      end
    end
  end
end
