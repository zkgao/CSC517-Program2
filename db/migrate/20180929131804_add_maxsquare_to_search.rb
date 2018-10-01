class AddMaxsquareToSearch < ActiveRecord::Migration[5.2]
  def change
    add_column :searches, :maxsquare, :decimal
  end
end
