class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
        t.string :location
        t.string :square_footage
        t.integer :year_built
        t.string :style, limit: 19
        t.integer :list_price
        t.integer :floors
        t.string :basement, limit: 3
        t.string :current_house_owner
        t.string :contact_information_for_listing_realtor
      t.timestamps
    end
  end
end
