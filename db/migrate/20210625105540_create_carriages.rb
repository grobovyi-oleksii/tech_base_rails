class CreateCarriages < ActiveRecord::Migration[6.1]
  def change
    create_table :carriages do |t|
      t.integer :kind
      t.integer :top_seats
      t.integer :bottom_seats
      t.belongs_to :train
      t.timestamps
    end
  end
end
