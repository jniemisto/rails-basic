class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :book_id
      t.integer :rating

      t.timestamps
    end
  end
end
