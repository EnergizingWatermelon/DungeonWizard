class CreateAbilities < ActiveRecord::Migration
  def change
    create_table :abilities do |t|
      t.string :name
      t.string :type
      t.text :description
      t.references :character, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
