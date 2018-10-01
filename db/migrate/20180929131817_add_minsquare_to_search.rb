class AddMinsquareToSearch < ActiveRecord::Migration[5.2]
  def change
    add_column :searches, :minsquare, :decimal
  end
end
