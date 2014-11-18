# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(email: 'ken@gmail.com', password: '123', password_confirmation: '123', username: 'nyhunter', fname: 'Ken', lname: 'Guie', location: nil, restname: 'KenKees', reststreet: 'Chinatown Square', restcity: 'Chicago', reststate: 'IL', restzip: '60616', restphone: '312-123-1234')
user2 = User.create(email: 'mei@gmail.com', password: '123', password_confirmation: '123', username: 'm', fname: 'Mei', lname: 'Ho', location: nil, restname: "Mei's Kitchen" , reststreet: '780 58 st', restcity: 'Brooklyn', reststate: 'NY', restzip: '11220', restphone: '718-718-1234')
user3 = User.create(email: 'k@k.com', password: '123', password_confirmation: '123', username: 'k', fname: 'Example', lname: 'Owner', location: nil, restname: 'Bamboo Gardens', reststreet: '1232 NE 163rd St', restcity: 'Miami', reststate: 'FL', restzip: '33162', restphone: '305-945-1722')

