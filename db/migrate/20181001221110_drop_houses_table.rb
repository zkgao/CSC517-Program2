class DropHousesTable < ActiveRecord::Migration[5.2]
  def up
      drop_table :houses
  end
  def down
      fail ActiveRecord::IrreversibleMigration
  end
end
