class CreateRealEstateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :real_estate_companies do |t|
      t.string :Name
      t.string :Webstie
      t.string :Address
      t.string :Size
      t.string :Founded
      t.string :Revenue
      t.string :Synopsis

      t.timestamps
    end
  end
end
