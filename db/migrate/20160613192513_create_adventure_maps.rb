class CreateAdventureMaps < ActiveRecord::Migration
  def change
    create_table :adventure_maps do |t|

      t.timestamps null: false
    end
  end
end
