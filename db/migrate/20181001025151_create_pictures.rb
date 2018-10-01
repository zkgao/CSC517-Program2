class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.integer :house_id
      t.string :picture_url

      t.timestamps
    end
  end
end
