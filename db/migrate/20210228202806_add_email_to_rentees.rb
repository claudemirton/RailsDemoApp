class AddEmailToRentees < ActiveRecord::Migration[6.0]
  def change
    add_column :rentees, :email, :string
  end
end
