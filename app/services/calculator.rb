class Calculator
  BASE_URL = 'https://aviapages.com/api/v1'
  HEADER = {'Authorization' => 'Token N9V2tg767Cu719za6fsdHssfp6Dck7782cdH'}
  @@clnt = HTTPClient.new

  def self.airports(query)
  	url = BASE_URL + "/airports/?search_by=city&fields=coords,tower_hours&query=" + query
  	@@clnt.get_content(url, query, HEADER)
  end
  
  def self.aircraft_types(query)
  	url = BASE_URL + "/aircraft_types?fields=alternative_names,aircraft_class&query=" + query
  	@@clnt.get_content(url, query, HEADER)
  end

  def self.flight_calculator(params)
  	url = BASE_URL + "/flight_calculator?" + params.to_query
  	@@clnt.get_content(url, query, HEADER)
  end
end
