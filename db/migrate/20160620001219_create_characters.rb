class CreateCharacters < ActiveRecord::Migration
  def change
    #create_table :climate do |t|
      #t.text :climate
    #end
    #create_table :terrain do |t|
      #t.text :terrain
    #end
    create_table :characters do |t|
      t.string :name
      t.string :xp
      t.string :cr
      t.text :climate
      #t.references :climte
      t.text :terrain
      #t.references :terrain
    end
  end
end
