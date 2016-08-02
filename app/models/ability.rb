# Model of an Ability that belongs to a character
class Ability < ActiveRecord::Base
  belongs_to :character
end
