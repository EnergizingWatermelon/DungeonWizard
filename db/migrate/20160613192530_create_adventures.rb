class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.string :title
      t.text :plot
      t.integer :party_size
      t.float :cr

      t.timestamps null: false
    end
    
    create_table :maps do |m|
      m.string :name
      m.integer :seed
      m.string :climate
      m.string :terrain
      m.references :adventure, index: true, foreign_key: true
    end
  end
end
