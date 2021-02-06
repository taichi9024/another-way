class AddEmailToFeedbacks < ActiveRecord::Migration[6.1]
  def change
    add_column :feedbacks, :email, :string, null: false
  end
end
