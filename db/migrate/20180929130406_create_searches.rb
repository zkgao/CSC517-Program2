class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.integer :companyid
      t.decimal :square
      t.decimal :price
      t.integer :yearbuilt

      t.timestamps
    end
  end
end
