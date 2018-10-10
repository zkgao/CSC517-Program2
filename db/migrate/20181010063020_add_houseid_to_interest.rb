class AddHouseidToInterest < ActiveRecord::Migration[5.2]
  def change
    add_column :interests, :house_id, :int
    add_column :interests, :buyer_id, :int
  end
end
