# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
channel = Channel.create(name: 'corporativo')

['aladdin', 'edmo', 'shima'].each do |login|
  user = User.create(login: login)
  user.channels = [channel]
  user.save!

  puts "login: #{user.login} created with channel: #{channel.name}"
end
