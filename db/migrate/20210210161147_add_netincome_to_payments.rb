class AddNetincomeToPayments < ActiveRecord::Migration[6.1]
  def change
    add_column :payments, :netincome, :integer, null: false
  end
end
