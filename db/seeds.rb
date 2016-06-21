# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#climate_tem = 'Temperate'
#climate_war = 'Warm'
#terrain_for = 'Forest'
#terrain_des = 'Desert'

#climates = [climate_tem,
#    climate_war
#    ]
#climates.each do |c|
#  Bestiary.create!(monster)
#end
#
#terrain = [terrain_for,
#    terrain_des
#    ]

monsters = [{:name => 'Kobold', :xp => '100', :cr => '0.25', :climate => 'Temperate', :terrain => 'Forest'},
            {:name => 'Red Dragon', :xp => '9001', :cr => '20', :climate => 'Warm', :terrain => 'Desert'},
  	 ]

monsters.each do |monster|
  Character.create!(monster)
end