# A single encounter(combat, trapped room, puzzle...) within a game session
class Encounter < ActiveRecord::Base
    has_and_belongs_to_many :characters
end
