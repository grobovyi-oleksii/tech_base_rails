class AddSeatsToCarriage < ActiveRecord::Migration[6.1]
  def change
    add_column :carriages, :side_top_seats, :integer
    add_column :carriages, :side_bottom_seats, :integer
    add_column :carriages, :eco_seats, :integer
  end
end
