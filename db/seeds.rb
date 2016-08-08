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
            {:name => 'Grimstalker', :xp => '1600', :cr => '5', :initiative => '9', :hp => '52', :ac => '18', :ac_touch => '15', :ac_flat => '13', :fort_save => '5', :ref_save => '11', :will_save => '7', :str => '12', :dex => '21', :con => '17', :int => '14', :wis => '13', :cha => '16', :monster_type => 'fey', :alignment => 'NE', :organization => 'solitary', :climate => 'Any', :terrain => 'Forest'},
            {:name => 'Baccae', :xp => '800', :cr => '3', :initiative => '3', :hp => '27', :ac => '15', :ac_touch => '13', :ac_flat => '12', :fort_save => '2', :ref_save => '7', :will_save => '3', :str => '15', :dex => '16', :con => '12', :int => '11', :wis => '9', :cha => '16', :monster_type => 'fey', :alignment => 'CN', :organization => 'gang', :climate => 'Any', :terrain => 'Forest'},
            {:name => 'Terror Wolf', :xp => '400', :cr => '1', :initiative => '2', :hp => '13', :ac => '14', :ac_touch => '12', :ac_flat => '12', :fort_save => '5', :ref_save => '5', :will_save => '1', :str => '13', :dex => '15', :con => '15', :int => '2', :wis => '12', :cha => '6', :monster_type => 'animal', :alignment => 'NE', :organization => 'solitary, gang', :climate => 'Cold', :terrain => 'Forest'},
            {:name => 'Dire Wolf', :xp => '800', :cr => '3', :initiative => '2', :hp => '37', :ac => '14', :ac_touch => '11', :ac_flat => '12', :fort_save => '7', :ref_save => '6', :will_save => '2', :str => '19', :dex => '15', :con => '17', :int => '2', :wis => '12', :cha => '10', :monster_type => 'animal', :alignment => 'N', :organization => 'solitary, gang', :climate => 'Cold', :terrain => 'Forest'},
            {:name => 'Goblin', :xp => '135', :cr => '0.33', :initiative => '6', :hp => '6', :ac => '16', :ac_touch => '13', :ac_flat => '14', :fort_save => '3', :ref_save => '2', :will_save => '-1', :str => '11', :dex => '15', :con => '12', :int => '10', :wis => '9', :cha => '6', :monster_type => 'humanoid', :alignment => 'NE', :organization => 'gang, warband, tribe', :climate => 'Temperate', :terrain => 'Forest'},
            {:name => 'Lynx', :xp => '600', :cr => '2', :initiative => '2', :hp => '13', :ac => '14', :ac_touch => '13', :ac_flat => '12', :fort_save => '5', :ref_save => '5', :will_save => '1', :str => '15', :dex => '15', :con => '15', :int => '2', :wis => '12', :cha => '6', :monster_type => 'animal', :alignment => 'N', :organization => 'solitary, pair, den', :climate => 'Cold', :terrain => 'Mountains'},
            {:name => 'Yeti', :xp => '1200', :cr => '4', :initiative => '1', :hp => '45', :ac => '17', :ac_touch => '10', :ac_flat => '16', :fort_save => '6', :ref_save => '6', :will_save => '6', :str => '19', :dex => '12', :con => '15', :int => '9', :wis => '12', :cha => '10', :monster_type => 'monstrous humanoid', :alignment => 'N', :organization => 'solitary, pair, tribe', :climate => 'Cold', :terrain => 'Mountains'},
            {:name => 'Bugbear', :xp => '600', :cr => '2', :initiative => '1', :hp => '16', :ac => '17', :ac_touch => '11', :ac_flat => '16', :fort_save => '2', :ref_save => '4', :will_save => '1', :str => '16', :dex => '13', :con => '13', :int => '10', :wis => '10', :cha => '9', :monster_type => 'humanoid', :alignment => 'CE', :organization => 'solitary, gang, nest', :climate => 'Temperate', :terrain => 'Mountains'},
            {:name => 'Orc', :xp => '135', :cr => '0.33', :initiative => '0', :hp => '6', :ac => '13', :ac_touch => '10', :ac_flat => '13', :fort_save => '3', :ref_save => '0', :will_save => '-1', :str => '17', :dex => '11', :con => '12', :int => '7', :wis => '8', :cha => '6', :monster_type => 'humanoid', :alignment => 'CE', :organization => 'solitary, gang, squad, band', :climate => 'Temperate', :terrain => 'Mountains'},
            {:name => 'Blood Hawk', :xp => '600', :cr => '1', :initiative => '2', :hp => '6', :ac => '14', :ac_touch => '13', :ac_flat => '13', :fort_save => '3', :ref_save => '4', :will_save => '2', :str => '11', :dex => '15', :con => '12', :int => '2', :wis => '14', :cha => '6', :monster_type => 'magical beast', :alignment => 'N', :organization => 'flock', :climate => 'Warm', :terrain => 'Mountains'},
            {:name => 'Dakon', :xp => '600', :cr => '2', :initiative => '2', :hp => '15', :ac => '15', :ac_touch => '11', :ac_flat => '15', :fort_save => '2', :ref_save => '5', :will_save => '4', :str => '21', :dex => '15', :con => '14', :int => '10', :wis => '12', :cha => '10', :monster_type => 'monstrous humanoid', :alignment => 'LN', :organization => 'solitary, gang, crew, band', :climate => 'Warm', :terrain => 'Mountains'},
            {:name => 'Elk', :xp => '400', :cr => '1', :initiative => '3', :hp => '15', :ac => '13', :ac_touch => '13', :ac_flat => '10', :fort_save => '6', :ref_save => '8', :will_save => '2', :str => '14', :dex => '17', :con => '16', :int => '2', :wis => '15', :cha => '7', :monster_type => 'animal', :alignment => 'N', :organization => 'solitary, pair, herd', :climate => 'Cold', :terrain => 'Plains'},
            {:name => 'Winter Wolf', :xp => '1600', :cr => '5', :initiative => '5', :hp => '57', :ac => '17', :ac_touch => '10', :ac_flat => '16', :fort_save => '9', :ref_save => '6', :will_save => '3', :str => '20', :dex => '13', :con => '18', :int => '9', :wis => '13', :cha => '10', :monster_type => 'magical beast', :alignment => 'NE', :organization => 'solitary, pair, pack', :climate => 'Cold', :terrain => 'Plains'},
            {:name => 'Giant Scorpion', :xp => '800', :cr => '3', :initiative => '0', :hp => '37', :ac => '16', :ac_touch => '9', :ac_flat => '16', :fort_save => '7', :ref_save => '1', :will_save => '1', :str => '19', :dex => '10', :con => '16', :int => '0', :wis => '10', :cha => '2', :monster_type => 'vermin', :alignment => 'N', :organization => 'solitary', :climate => 'Temperate', :terrain => 'Plains'},
            {:name => 'Krenshar', :xp => '400', :cr => '1', :initiative => '6', :hp => '13', :ac => '15', :ac_touch => '12', :ac_flat => '13', :fort_save => '4', :ref_save => '5', :will_save => '1', :str => '11', :dex => '14', :con => '13', :int => '6', :wis => '12', :cha => '13', :monster_type => 'magical beast', :alignment => 'N', :organization => 'solitary, pair, pride', :climate => 'Temperate', :terrain => 'Plains'},
            {:name => 'Goliath Stag Beetle', :xp => '4800', :cr => '8', :initiative => '0', :hp => '104', :ac => '21', :ac_touch => '8', :ac_flat => '21', :fort_save => '12', :ref_save => '3', :will_save => '3', :str => '32', :dex => '10', :con => '21', :int => '0', :wis => '10', :cha => '4', :monster_type => 'vermin', :alignment => 'N', :organization => 'solitary, pair, herd', :climate => 'Warm', :terrain => 'Plains'},
            {:name => 'Hyena', :xp => '400', :cr => '1', :initiative => '2', :hp => '13', :ac => '14', :ac_touch => '12', :ac_flat => '12', :fort_save => '5', :ref_save => '5', :will_save => '1', :str => '14', :dex => '15', :con => '15', :int => '2', :wis => '13', :cha => '6', :monster_type => 'animal', :alignment => 'N', :organization => 'solitary, pair, pack', :climate => 'Warm', :terrain => 'Plains'},
            {:name => 'Bog Mummy', :xp => '1600', :cr => '5', :initiative => '4', :hp => '60', :ac => '20', :ac_touch => '10', :ac_flat => '20', :fort_save => '4', :ref_save => '2', :will_save => '8', :str => '24', :dex => '10', :con => '0', :int => '6', :wis => '15', :cha => '15', :monster_type => 'undead', :alignment => 'LE', :organization => 'solitary, warden squad, guardian detail', :climate => 'Any', :terrain => 'Swamp'},
            {:name => 'Mudbug', :xp => '800', :cr => '3', :initiative => '-5', :hp => '31', :ac => '4', :ac_touch => '4', :ac_flat => '4', :fort_save => '7', :ref_save => '-4', :will_save => '-4', :str => '20', :dex => '1', :con => '23', :int => '0', :wis => '1', :cha => '1', :monster_type => 'ooze', :alignment => 'N', :organization => 'solitary', :climate => 'Any', :terrain => 'Swamp'},
            {:name => 'Vampiric Mist', :xp => '800', :cr => '3', :initiative => '8', :hp => '30', :ac => '14', :ac_touch => '14', :ac_flat => '10', :fort_save => '4', :ref_save => '5', :will_save => '5', :str => '0', :dex => '19', :con => '16', :int => '7', :wis => '13', :cha => '10', :monster_type => 'aberration', :alignment => 'NE', :organization => 'solitary,pair, gang', :climate => 'Temperate', :terrain => 'Swamp'},
            {:name => 'Rust Monster', :xp => '800', :cr => '3', :initiative => '3', :hp => '27', :ac => '18', :ac_touch => '13', :ac_flat => '15', :fort_save => '2', :ref_save => '4', :will_save => '5', :str => '10', :dex => '17', :con => '13', :int => '2', :wis => '13', :cha => '8', :monster_type => 'aberration', :alignment => 'N', :organization => 'solitary, pair, nest', :climate => 'Any', :terrain => 'Underground'},
            {:name => 'Slurk', :xp => '600', :cr => '2', :initiative => '6', :hp => '17', :ac => '15', :ac_touch => '12', :ac_flat => '13', :fort_save => '6', :ref_save => '5', :will_save => '0', :str => '15', :dex => '14', :con => '17', :int => '3', :wis => '10', :cha => '10', :monster_type => 'magical beast', :alignment => 'N', :organization => 'solitary, pair, pack', :climate => 'Any', :terrain => 'Underground'},
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