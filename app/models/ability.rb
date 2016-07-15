# Model of an Ability taht belongs to a character
class Ability < ActiveRecord::Base
  belongs_to :character
end
