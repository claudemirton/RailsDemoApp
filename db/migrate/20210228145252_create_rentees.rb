class CreateRentees < ActiveRecord::Migration[6.0]
  def change
    create_table :rentees do |t|
      t.string :name
      t.string :phone
      t.references :car, null: false, foreign_key: true

      t.timestamps
    end
  end
end
