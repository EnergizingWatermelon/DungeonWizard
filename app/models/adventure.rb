# Adventure Model
# Composed of a map filled with encounters
class Adventure < ActiveRecord::Base
    has_one :map
end
