class AddSeatToSpaces < ActiveRecord::Migration[6.1]
  def change
    add_column :spaces, :seat, :integer
  end
end
