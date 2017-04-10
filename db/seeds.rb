# Seeding database

User.create(
  email: 'admin@billionairesjet.com',
  name: 'Demo Admin',
  role: 'admin',
  password: 123123,
  confirmed_at: Time.now)

User.create(
  email: 'customer@billionairesjet.com',
  name: 'Demo Customer',
  role: 'customer',
  password: 123123,
  confirmed_at: Time.now)

User.create(
  email: 'user@billionairesjet.com',
  name: 'Demo User',
  role: 'user',
  password: 123123,
  confirmed_at: Time.now)

Car.delete_all

Car.create(
  brand: 'Rolls Royce',
  model: 'Phantom',
  type: 'Luxury',
  description: 'This car is a standard of classical British luxury. This is a real glamorous mixture of high-tech and archaic that makes this car so popular among the aristocratic elite. It’s just amazing when the luxurious interior decor, expensive leather, sheepskin rugs, mini-bar, special glasses for champagne and many other luxury items for passengers are combined with advanced technology: for example a unique multimedia system or special electronic control, which is always ready to tells you about everything on the road automatically. 8-speed automatic transmission, shifts gears imperceptibly for passengers. 6-liter twin-turbo v12 produces 570 horsepower. Acceleration from 0 to 62 is in just 4.9 seconds. A unique suspension adjustment monitors the situation independently, and nothing  prevents you enjoy the ride. Yes, Rolls Royce Ghost is a luxury that don’t need any words. Call and rent right now!',
  seats: 4,
  power: 460,
  engine: '6.8 L V12',
  top_speed: 155,
  daily_rental: 2_585,
  price_per_miles: 9,
  deposit: 20_000,
  daily_miles: 100,
  extra_price_per_mile: 7,
  fuel_on_city: 11,
  fuel_on_hightway: 19
  )
Car.create(
  brand: 'Rolls Royce',
  model: 'Ghost',
  type: 'Luxury',
  description: 'This car is a standard of classical British luxury. This is a real glamorous mixture of high-tech and archaic that makes this car so popular among the aristocratic elite. It’s just amazing when the luxurious interior decor, expensive leather, sheepskin rugs, mini-bar, special glasses for champagne and many other luxury items for passengers are combined with advanced technology: for example a unique multimedia system or special electronic control, which is always ready to tells you about everything on the road automatically. 8-speed automatic transmission, shifts gears imperceptibly for passengers. 6-liter twin-turbo v12 produces 570 horsepower. Acceleration from 0 to 62 is in just 4.9 seconds. A unique suspension adjustment monitors the situation independently, and nothing  prevents you enjoy the ride. Yes, Rolls Royce Ghost is a luxury that don’t need any words. Call and rent right now!',
  seats: 4,
  engine: '6.6 L V12',
  power: 570,
  top_speed: 155,
  daily_rental: 1_585,
  price_per_miles: 9,
  deposit: 20_000,
  daily_miles: 100,
  extra_price_per_mile: 7,
  fuel_on_city: 11,
  fuel_on_hightway: 19
  )

Car.create(
  brand: 'Rolls Royce',
  model: 'Wraith',
  type: 'Luxury',
  description: 'The most daring among all luxury cars, which are not available to the masses -Rolls Royce Wraith, splendid 2 door coupe luxury. This car has peerless soft leather, precious wood, metal accessories and amazing sound system  about  1300 watts of power and has 18 speakers, able to turn anyone into a real music lover! A unique new multimedia system with voice recognition is integrated here. In addition, Rolls Royce Wraith is the most powerful vehicle for the elite. Engine v12 twin turbo volume of 6.6 liters produces 632 net horsepower. The maximum torque is 800 NM, and acceleration is from 0 to 62 in just 4.6 seconds. Top speed is limited on a mark of 155 miles per hour. But why do you need to hurry? After all, one of the most interesting features of the car is a very special interior design called “star sky”. 1340 small lamps installed in the ceiling create a special mood that makes you just move to another world, and forget about the flow of time. This car is for those who want a special leisure, luxury full of romance and luxury experiences. Book now and get dopolnitelnyyu gift from the company.',
  seats: 4,
  power: 632,
  engine: '6.6 L V12',
  top_speed: 155,
  daily_rental: 2_589,
  price_per_miles: 9,
  deposit: 20_000,
  daily_miles: 100,
  extra_price_per_mile: 7,
  fuel_on_city: 11,
  fuel_on_hightway: 19
  )

Car.create(
  brand: 'Rolls Royce',
  model: 'Phantom Drophead',
  type: 'Luxury',
  description: 'This is good old classics, but much more advanced, then the most of modern cars. More curved and has a lot of technical innovations.  The designers claim that they were inspired by the images of classic racing yacht of 30’s – a pure combination of agility, speed, power and beauty. What could be more romantic than listening to a soft rain drumming on the tiny roof of a luxury cabriolet? Especially, when you know that the roof is not just a tribute to the classic design but it is the latest technology which turns a cloth roof into a heavy-duty and capable to perfectly isolate you from the urban noise. 6 liter V12, capacity of 453 horsepower, accelerates from 0 to 62 miles per hour in 5.8 seconds and a speed limiter is stopped on a mark 149 miles per hour. But why do you need to rush? Rolls Royce Phantom Drophead simply requires time to stop. One of the best proposals for the celebration, leisure or a romantic stroll. Call us to learn more.',
  seats: 4,
  power: 453,
  engine: '6.8 L V12',
  top_speed: 155,
  daily_rental: 2_589,
  price_per_miles: 9,
  deposit: 20_000,
  daily_miles: 100,
  extra_price_per_mile: 7,
  fuel_on_city: 11,
  fuel_on_hightway: 19
  )

Car.create(
  brand: 'Lamborghini',
  model: 'Huracan',
  type: 'Sport',
  description: 'This is good old classics, but much more advanced, then the most of modern cars. More curved and has a lot of technical innovations.  The designers claim that they were inspired by the images of classic racing yacht of 30’s – a pure combination of agility, speed, power and beauty. What could be more romantic than listening to a soft rain drumming on the tiny roof of a luxury cabriolet? Especially, when you know that the roof is not just a tribute to the classic design but it is the latest technology which turns a cloth roof into a heavy-duty and capable to perfectly isolate you from the urban noise. 6 liter V12, capacity of 453 horsepower, accelerates from 0 to 62 miles per hour in 5.8 seconds and a speed limiter is stopped on a mark 149 miles per hour. But why do you need to rush? Rolls Royce Phantom Drophead simply requires time to stop. One of the best proposals for the celebration, leisure or a romantic stroll. Call us to learn more.',
  seats: 4,
  power: 400,
  engine: '6.8 L V12',
  top_speed: 155,
  daily_rental: 2_589,
  price_per_miles: 9,
  deposit: 20_000,
  daily_miles: 100,
  extra_price_per_mile: 7,
  fuel_on_city: 11,
  fuel_on_hightway: 19
  )
Car.create(
  brand: 'Porshe',
  model: '911 Carrera S4',
  type: 'Sport',
  description: 'It is an exceptional car, completely unique and beautiful. Under the familiar face there are hidden the latest technology and advanced materials. Porsche 911 Carrera 4s is an easy, very fast, all-wheel drive sports car with a special character. Displacement 3.8 provides full 400 horsepower. Acceleration to 62 miles per hour is in 4.5 seconds. Incredible precise tuning of suspension, 7 -speed manual gearbox and traction control can add you fun. This is perhaps the best sports car for every day, it performs well both in the city and on the highway, regardless of the weather conditions. Driving this car is a real pleasure. Porsche 911 Carrera 4s turns anyone into a fun and adventurous person. It is bright and emotional, it awakes your energy and is waiting you for a fun jerk. Call now!',
  seats: 4,
  power: 400,
  engine: '3.8 L 6',
  top_speed: 188,
  daily_rental: 989,
  price_per_miles: 9,
  deposit: 20_000,
  daily_miles: 100,
  extra_price_per_mile: 7,
  fuel_on_city: 11,
  fuel_on_hightway: 19
  )
Car.create(
  brand: 'Bentley',
  model: 'Mulsanne',
  type: 'Sport',
  description: 'It is an exceptional car, completely unique and beautiful. Under the familiar face there are hidden the latest technology and advanced materials. Porsche 911 Carrera 4s is an easy, very fast, all-wheel drive sports car with a special character. Displacement 3.8 provides full 400 horsepower. Acceleration to 62 miles per hour is in 4.5 seconds. Incredible precise tuning of suspension, 7 -speed manual gearbox and traction control can add you fun. This is perhaps the best sports car for every day, it performs well both in the city and on the highway, regardless of the weather conditions. Driving this car is a real pleasure. Porsche 911 Carrera 4s turns anyone into a fun and adventurous person. It is bright and emotional, it awakes your energy and is waiting you for a fun jerk. Call now!',
  seats: 4,
  power: 512,
  engine: '6.8 L V8',
  top_speed: 158,
  daily_rental: 1_589,
  price_per_miles: 9,
  deposit: 20_000,
  daily_miles: 100,
  extra_price_per_mile: 7,
  fuel_on_city: 11,
  fuel_on_hightway: 19
  )
Car.create(
  brand: 'Bentley',
  model: 'Continental GTC',
  type: 'Sport',
  description: 'The most popular car among millionaires, bankers, pop stars and famous athletes. This glamour and luxury car speaks for itself. Bentley Continental GTC is one of the most luxurious and comfortable mega convertibles in the world. In addition, this vehicle can boast its real sports power. 6 liter V12 twin turbo produces as much as 625 horsepower, and launches from 0 to 62 miles per hour only for 4.4 seconds. The machine is conservative in the best sense of the word. You can enjoy the driving of this car from start to finish. You control this amazing limousine class cabriolet so easily that is seems to be a game. It is an ideal vehicle for any occasion whether it is a business meeting or a romantic walk. Rent now and get a special offer!',
  seats: 4,
  power: 625,
  engine: '4.0 L V8',
  top_speed: 200,
  daily_rental: 1_489,
  price_per_miles: 9,
  deposit: 20_000,
  daily_miles: 100,
  extra_price_per_mile: 7,
  fuel_on_city: 11,
  fuel_on_hightway: 19
  )
Car.create(
  brand: 'Maybach',
  model: 'S600',
  type: 'Luxury',
  description: 'This is the best limousine according to numerous publications of different car magazines. Outwardly, it is not much different from Mercedes Benz class, but it is much better inside. Every detail emphasizes its connection to the VIP class limousines.  In the back row there are passenger places – 2 luxurious chairs with Electrical adjustment and massage function. There are also 2 personal desks and 2 different multimedia monitors separately for each passenger. The individual climate control allows to saturate the air around you with your favorite fragrance. Specially designed windows make passengers less visible allowing you to enjoy the peace and solitude. High technology is everywhere in this car, and does its work invisible to the eye. And does it perfectly. 2 silver goblet are no less impressive. This is the work of best German masters. Even the fluffy carpet on the floor, or the peerless sound system every time hint you that this vehicle is specifically designed for the elite. And if it is what you searching for, go and rent Maybach s600! Call now to rent and get a special gift from our company.',
  seats: 4,
  power: 523,
  engine: '6.0 L V12',
  top_speed: 130,
  daily_rental: 1_489,
  price_per_miles: 9,
  deposit: 20_000,
  daily_miles: 100,
  extra_price_per_mile: 7,
  fuel_on_city: 11,
  fuel_on_hightway: 19
  )

Car.create(
  brand: 'Mercedes',
  model: 'Benz S',
  type: 'Luxury',
  description: 'This is the best limousine according to numerous publications of different car magazines. Outwardly, it is not much different from Mercedes Benz class, but it is much better inside. Every detail emphasizes its connection to the VIP class limousines.  In the back row there are passenger places – 2 luxurious chairs with Electrical adjustment and massage function. There are also 2 personal desks and 2 different multimedia monitors separately for each passenger. The individual climate control allows to saturate the air around you with your favorite fragrance. Specially designed windows make passengers less visible allowing you to enjoy the peace and solitude. High technology is everywhere in this car, and does its work invisible to the eye. And does it perfectly. 2 silver goblet are no less impressive. This is the work of best German masters. Even the fluffy carpet on the floor, or the peerless sound system every time hint you that this vehicle is specifically designed for the elite. And if it is what you searching for, go and rent Maybach s600! Call now to rent and get a special gift from our company.',
  seats: 4,
  power: 630,
  engine: '6.0 L V12',
  top_speed: 190,
  daily_rental: 989,
  price_per_miles: 9,
  deposit: 20_000,
  daily_miles: 100,
  extra_price_per_mile: 7,
  fuel_on_city: 11,
  fuel_on_hightway: 19
  )

Car.create(
  brand: 'Mercedes',
  model: 'Benz G63 AMG',
  type: 'Luxury',
  description: 'The most brutal super SUV, which began its history as a vehicle for special road conditions and was used mainly for special services. Now the years have passed, and a lot of improvements from the best German tuning studios turned it into a leader of luxury SUVs. It can be where others can’t. Mercedes Benz g63 is able to drive on the most impossible roads. But it seems like passengers do not even notice it, because this car has elevated interior comfort. Mercedes Benz g63 was made for tough guys who want to get their portion of adrenaline. This is the best choice for those who need a comfortable SUV for the active vocations, or for visiting places with difficult access. Or this is the best as a special VIP supporting SUV.',
  seats: 4,
  power: 630,
  engine: '5.5 L V8',
  top_speed: 150,
  daily_rental: 989,
  price_per_miles: 9,
  deposit: 20_000,
  daily_miles: 100,
  extra_price_per_mile: 7,
  fuel_on_city: 11,
  fuel_on_hightway: 19
  )

Car.create(
  brand: 'Cadillac',
  model: 'Escalade ESV',
  type: 'Luxury',
  description: 'The most luxurious SUV in the world – Cadillac Escalade ESV is synonymous with success. You do not need any words, just stay calm and confident and drive this car. It is gorgeous as inside as outside. The luxurious interior is created by the best masters, so every detail is a work of art. V8 engine capacity of 6.2 liters produces 482 horsepower output. The main pride is electronic multimedia system, which can be managed by you virtually at the level of intuition. Another thing that makes this car so particular is a special projection display. Also we would like to draw your attention to the comfort – dual-zone automatic climate control, wireless charger, large comfortable doors and seats that can be automatically folded for a few seconds. Cadillac Escalade ESV is created with a reference to the technology of the future. It is the ideal choice for serious business meetings, events, for show biz or luxury celebrations.',
  seats: 8,
  power: 482,
  engine: '6.2 L V8',
  top_speed: 127,
  daily_rental: 989,
  price_per_miles: 9,
  deposit: 20_000,
  daily_miles: 100,
  extra_price_per_mile: 7,
  fuel_on_city: 11,
  fuel_on_hightway: 19
  )

JetType.create(
  name: 'Very Light Jets',
  short_name: 'very_light',
  description: 'We provide different variety of Very Light Business Jets with seating capacity from 4-8 people and which provides with a maximum safety and comfort by our professional team.'
  )

JetType.create(
  name: 'Light Jets',
  short_name: 'light',
  description: 'We offers you not just safety, comfort or luxury atmosphere. Our Light Jets have everything you need on board from equipments for work until high speed of Internet.'
  )

JetType.create(
  name: 'Heavy Jets',
  short_name: 'heavy',
  description: 'Heavy Jet is absolutely right aircraft to choose if you are planning group or corporate event. We are glad to provide you flight consulting assistance anywhere and anytime to make your trip more enjoyable'
  )

JetType.create(
  name: 'Super Midsize Jets',
  short_name: 'super_midsize',
  description: 'Business Super Midsize Jets is perfectly for whom who cannot use standard form of commercial flights and who cares of time. Choose you private business aircraft and feel free to contact us any time.'
  )

JetType.create(
  name: 'Midsize Jets',
  short_name: 'midsize',
  description: 'All of our Private Jets are always in perfect condition and guaranteed by their regular checks. We ensure high qualification of the crew and flight attendants on the board. Review our Midsize Jets.'
  )

JetType.create(
  name: 'Jumbo Jets',
  short_name: 'jumbo',
  description: 'Jumbo Jet is well known as a wide body of commercial airline and cargo aircraft. Boeing 747 is amazing with hump-like upper deck to serve as a first class lounge and which allows easily converted to cargo carrier.'
  )

State.create(name: 'New York', cities_attributes: [{name: "New York City"}], location_attributes: {lat: 40.7058249,lng: -74.1184296})
State.create(name: 'Caliornia', cities_attributes: [{name: "Los Angeles"},{name: 'San Diego'},{name: 'San Francisco'}], location_attributes: {lat: 37.1953602,lng: -119.4891492})
State.create(name: 'Florida', cities_attributes: [{name: "Miami"},{name: 'Tampa'},{name: 'Orlando'}], location_attributes: {lat: 28.9985318140518,lng: -81.97998046875})


Jet.create(type: "Very Light Jets", brand: "Honda", model: "Jet", description: "Honda Jet is a first Aircraft developed by company...", 
  sleeps: 0, passengers: 4, range: 1009, luggage_capacity: 66)

Jet.create(type: "Heavy Jets", brand: "Gulfstream ", model: "G650", description: "Functionality is a mainstay of the Gulfstream G650...",  
  sleeps: 10, passengers: 19, range: 12_964, luggage_capacity: 130, aircraft_profile: "Gulfstream G650")

Jet.create(type: "Heavy Jets", brand: "Gulfstream ", model: "G600", description: "Functionality is a mainstay of the Gulfstream G600...",  
  sleeps: 9, passengers: 19, range: 11_482, luggage_capacity: 130, aircraft_profile: "Gulfstream G600")

Jet.create(type: "Heavy Jets", brand: "Gulfstream ", model: "G500", description: "Functionality is a mainstay of the Gulfstream G500...",  
  sleeps: 8, passengers: 19, range: 9_260, luggage_capacity: 130, aircraft_profile: "Gulfstream G500")

Jet.create(type: "Heavy Jets", brand: "Gulfstream ", model: "G550", description: "Functionality is a mainstay of the Gulfstream G550...",  
  sleeps: 8, passengers: 19, range: 12_501, luggage_capacity: 130, aircraft_profile: "Gulfstream G550")

Jet.create(type: "Super Midsize Jets", brand: "Gulfstream ", model: "G280", description: "Functionality is a mainstay of the Gulfstream G280...",  
  sleeps: 5, passengers: 10, range: 6_670, luggage_capacity: 130, aircraft_profile: "Gulfstream G280")

