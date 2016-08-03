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



monsters = [{:name => 'Rattata', :xp => '20', :cr => '0.05', :initiative => '0', :hp => '1', :ac => '12', :ac_touch => '12', :ac_flat => '10', :fort_save => '-1', :ref_save => '2', :will_save => '-1', :str => '6', :dex => '14', :con => '10', :int => '10', :wis => '8', :cha => '8', :monster_type => 'pocket', :alignment => 'CE', :organization => 'solitary, gang, nest', :climate => 'Any', :terrain => 'Forest'},
            {:name => 'Zubat', :xp => '20', :cr => '0.05', :initiative => '0', :hp => '1', :ac => '12', :ac_touch => '12', :ac_flat => '10', :fort_save => '-1', :ref_save => '2', :will_save => '-1', :str => '6', :dex => '14', :con => '10', :int => '10', :wis => '8', :cha => '8', :monster_type => 'pocket', :alignment => 'CE', :organization => 'solitary, gang, nest', :climate => 'Any', :terrain => 'Dungeon'},
            {:name => 'Kobold', :xp => '100', :cr => '0.25', :initiative => '1', :hp => '5', :ac => '15', :ac_touch => '12', :ac_flat => '14', :fort_save => '2', :ref_save => '1', :will_save => '-1', :str => '9', :dex => '13', :con => '10', :int => '10', :wis => '9', :cha => '8', :monster_type => 'humanoid', :alignment => 'LE', :organization => 'solitary, gang, nest', :climate => 'Temperate', :terrain => 'Forest'},
            {:name => 'Giant Scorpion', :xp => '800', :cr => '3', :climate => 'Warm', :terrain => 'Desert'},
            {:name => 'Yeti', :xp => '1200', :cr => '4', :climate => 'Cold', :terrain => 'Mountains'},
            {:name => 'Dire Shark', :xp => '600', :cr => '2', :climate => 'Any', :terrain => 'Ocean'},
            {:name => 'Killer Whale', :xp => '100', :cr => '0.25', :climate => 'Cold', :terrain => 'Ocean'},
            {:name => 'Gorgon', :xp => '4800', :cr => '8', :climate => 'Temperate', :terrain => 'Plains'},
            {:name => 'Dracolisk', :xp => '3200', :cr => '7', :climate => 'Temperate', :terrain => 'Swamp'},
            {:name => 'Dark Stalker', :xp => '1200', :cr => '4', :climate => 'Cold', :terrain => 'Underground'},
            {:name => 'Dark Stalker', :xp => '1200', :cr => '4', :climate => 'Temperate', :terrain => 'Underground'},
            {:name => 'Dark Stalker', :xp => '1200', :cr => '4', :climate => 'Warm', :terrain => 'Underground'},
            {:name => 'Giant Filled Lizard', :xp => '1600', :cr => '5', :climate => 'Warm', :terrain => 'Forest'},
            #http://www.d20pfsrd.com/bestiary/monster-listings/dragons/jabberwock
            {:name => 'Jabberwock', :xp => '819200', :cr => '23', :initiative => '5', :hp => '455', :ac => '40', :ac_touch => '14', :ac_flat => '34', :fort_save => '26', :ref_save => '20', :will_save => '24', :str => '37', :dex => '20', :con => '33', :int => '12', :wis => '29', :cha => '26', :monster_type => 'Dragon', :alignment => 'CE', :organization => 'solitary', :climate => 'Any', :terrain => 'Forest'},
  	 ]

monsters.each do |monster|
  Character.create!(monster)
end

=begin
require 'csv'
#NOTE-CSV does not have climate/terrain fields- they are condensed into 'environment'. TODO: splite csv field into two
fields_to_insert = %w{ name xp cr initiative speed hp ac ac_touch ac_flat fort_save ref_save will_save str dex con int wis cha type alignment climate terrain organization treasure }
rows_to_insert = []

CSV.foreach("lib/d20characters.csv", headers: true) do |row|
  row_to_insert = row.to_hash.select { |k, v| fields_to_insert.include?(k) }
  rows_to_insert << row_to_insert
end

rows_to_insert.each do |monster|
  Character.create!(monster)
end
=end