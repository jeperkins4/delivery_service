# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
Franchise.find_or_create_by(name: 'Tallahassee', location: 'Tallahassee, FL')
Franchise.find_or_create_by(name: 'Gainesville', location: 'Gainesville, FL')
Franchise.find_or_create_by(name: 'Jacksonville', location: 'Jacksonville, FL')
Franchise.find_or_create_by(name: 'Tampa', location: 'Tampa, FL')
Franchise.find_or_create_by(name: 'St Petersburg', location: 'St Petersburg, FL')
Franchise.find_or_create_by(name: 'Miami', location: 'Miami, FL')
Franchise.find_or_create_by(name: 'Orlando', location: 'Orlando, FL')
Franchise.find_or_create_by(name: 'Palm Beach', location: 'Palm Beach, FL')
Franchise.find_or_create_by(name: 'Space Coast', location: 'Melbourne, FL')
Franchise.find_or_create_by(name: 'Charlotte', location: 'Charlotte, NC')
Franchise.find_or_create_by(name: 'Raleigh', location: 'Raleigh, NC')
Franchise.find_or_create_by(name: 'Nashville', location: 'Nashville, TN')
Franchise.find_or_create_by(name: 'Knoxville', location: 'Knoxville, TN')
Franchise.find_or_create_by(name: 'Birmingham', location: 'Birmingham, AL')
Franchise.find_or_create_by(name: 'Dallas', location: 'Dallas, TX')
Franchise.find_or_create_by(name: 'Denver', location: 'Denver, CO')
