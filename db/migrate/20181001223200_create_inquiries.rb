class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.integer :houseid
      t.integer :userid
      t.string :subject
      t.string :msg

      t.timestamps
    end
  end
end
