class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.references :user, null: false, foreign_key: true
      t.string :owner, null: false
      t.string :placename, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
