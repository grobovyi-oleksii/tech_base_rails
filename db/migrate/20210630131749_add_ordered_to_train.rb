class AddOrderedToTrain < ActiveRecord::Migration[6.1]
  def change
    add_column :trains, :order_carriage, :boolean, default: true
  end
end
