class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.integer :Id
      t.string :Location

      t.timestamps
    end
  end
end
