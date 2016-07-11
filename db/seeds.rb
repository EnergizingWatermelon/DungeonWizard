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
            {:name => 'Giant Scorpion', :xp => '800', :cr => '3', :climate => 'Warm', :terrain => 'Desert'},
            {:name => 'Yeti', :xp => '1200', :cr => '4', :climate => 'Cold', :terrain => 'Mountains'},
            {:name => 'Dire Shark', :xp => '600', :cr => '2', :climate => 'Cold', :terrain => 'Ocean'},
            {:name => 'Dire Shark', :xp => '600', :cr => '2', :climate => 'Temperate', :terrain => 'Ocean'},
            {:name => 'Dire Shark', :xp => '600', :cr => '2', :climate => 'Warm', :terrain => 'Ocean'},
            {:name => 'Gorgon', :xp => '4800', :cr => '8', :climate => 'Temperate', :terrain => 'Plains'},
            {:name => 'Dracolisk', :xp => '3200', :cr => '7', :climate => 'Temperate', :terrain => 'Swamp'},
            {:name => 'Dark Stalker', :xp => '1200', :cr => '4', :climate => 'Cold', :terrain => 'Underground'},
            {:name => 'Dark Stalker', :xp => '1200', :cr => '4', :climate => 'Temperate', :terrain => 'Underground'},
            {:name => 'Dark Stalker', :xp => '1200', :cr => '4', :climate => 'Warm', :terrain => 'Underground'},
            {:name => 'Giant Filled Lizard', :xp => '1600', :cr => '5', :climate => 'Warm', :terrain => 'Forest'},
  	 ]

monsters.each do |monster|
  Character.create!(monster)
end