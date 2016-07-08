class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :xp
      t.float :cr
      t.integer :initiative
      t.integer :speed
      t.integer :hp
      t.integer :ac
      t.integer :ac_touch
      t.integer :ac_flat
      t.integer :fort_save
      t.integer :ref_save
      t.integer :will_save
      t.integer :str
      t.integer :dex
      t.integer :con
      t.integer :int
      t.integer :wis
      t.integer :cha
      t.string :monster_type
      t.string :alignment
      t.string :organization
      t.string :environment
      t.string :treasure
      t.text :description
    end
    
    
  end
end
