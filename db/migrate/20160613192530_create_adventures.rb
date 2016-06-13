class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|

      t.timestamps null: false
    end
  end
end
