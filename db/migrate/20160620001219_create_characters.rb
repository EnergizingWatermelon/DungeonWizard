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
      t.string :climate
      t.string :terrain
      t.string :treasure
      t.text :description
    end
    
     create_table :encounters do |e|
      e.text :details
      e.integer :party_size
      e.float :cr
      e.string :climate
      e.string :terrain
      e.integer :seed
      e.timestamps null: false
    end
    
    create_table :characters_encounters, id: false do |ec|
      ec.belongs_to :character, index: true
      ec.belongs_to :encounter, index: true
    end
  end
end
