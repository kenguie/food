# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(email: 'ken@gmail.com', password: '12345678', password_confirmation: '12345678', username: 'nyhunter', fname: 'Ken', lname: 'Guie', location: nil, restname: 'KenKees', reststreet: 'Chinatown Square', restcity: 'Chicago', reststate: 'IL', restzip: '60616', restphone: '312-123-1234', latitude: 41.8502689, longitude: -87.63183819999999)
user2 = User.create(email: 'mei@gmail.com', password: '12345678', password_confirmation: '12345678', username: 'm', fname: 'Mei', lname: 'Ho', location: nil, restname: "Mei's Kitchen" , reststreet: '780 58 st', restcity: 'Brooklyn', reststate: 'NY', restzip: '11220', restphone: '718-718-1234', latitude: 40.6367795, longitude: -74.0086493)
user3 = User.create(email: 'k@gmail.com', password: '12345678', password_confirmation: '12345678', username: 'k', fname: 'Example', lname: 'Owner', location: nil, restname: 'Bamboo Gardens', reststreet: '1232 NE 163rd St', restcity: 'Miami', reststate: 'FL', restzip: '33162', restphone: '305-945-1722', latitude: 25.9251974, longitude: -80.1751316)
user4 = User.create(email: 'gw@gmail.com', password: '12345678', password_confirmation: '12345678', username: 'gw', fname: 'G', lname: 'W', location: nil, restname: 'Super Great Wall', reststreet: '198 Maine Mall Rd', restcity: 'Portland', reststate: 'ME', restzip: '04106', restphone: '(207) 771-9988', latitude: 43.6398853, longitude: -70.3326289)
user5 = User.create(email: 'hc@gmail.com', password: '12345678', password_confirmation: '12345678', username: 'hc', fname: 'Happy', lname: 'Cafe', location: nil, restname: 'Happy Cafe', reststreet: '2351 S Wentworth Ave', restcity: 'Chicago', reststate: 'IL', restzip: '60616', restphone: '(312) 842-1818', latitude: 41.8495959, longitude: -87.6317108)

