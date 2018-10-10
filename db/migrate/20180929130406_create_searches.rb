class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.integer :companyid
      t.decimal :minprice
      t.decimal :maxprice
      t.integer :yearbuilt

      t.timestamps
    end
  end
end
