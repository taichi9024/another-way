class CreateSpaces < ActiveRecord::Migration[6.1]
  def change
    create_table :spaces do |t|
      t.string :name, null: false
      t.string :pref, null: false
      t.string :city, null: false
      t.string :detailaddress
      t.integer :tel, null: false
      t.string :station, null: false
      t.integer :station_walk, null: false
      t.text :description, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :spaces, :name
    add_index :spaces, :pref  
    add_index :spaces, :station
  end
end
