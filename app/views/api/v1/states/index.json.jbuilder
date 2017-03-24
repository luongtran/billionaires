json.set! :http_status_code, 200
json.set! :success, true
json.set! :message, t('states.get.success')
json.data do
  json.states do
    json.array! @states do |state|
      json.id state.id
      json.name state.name
      json.location do
        json.lat state.location ? state.location.lat : null
        json.lng state.location ? state.location.lng : null
      end
      json.cities do
        json.array! state.cities, :id, :name
      end
    end
  end
end
