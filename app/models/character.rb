# Character Model- any character within the game
class Character < ActiveRecord::Base
    has_many :abilities
end
