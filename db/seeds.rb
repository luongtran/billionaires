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
