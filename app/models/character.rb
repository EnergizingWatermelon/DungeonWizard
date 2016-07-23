# Character Model- any character within the game
class Character < ActiveRecord::Base
    has_many :abilities
    has_and_belongs_to_many :encounters
end
