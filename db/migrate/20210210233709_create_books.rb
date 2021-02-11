class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.references :user, null: false, foreign_key: true
      t.references :space, null: false, foreign_key: true
      t.integer :price, null: false
      t.integer :hours, null: false
      t.integer :wholeprice, null: false
      t.datetime :bookdate, null: false
      t.integer :seatnum, null: false

      t.timestamps
    end
  end
end
