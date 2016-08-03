class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.date :added_on
      t.date :to_be_completed_on
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
