class AddIndexesToCarriages < ActiveRecord::Migration[6.1]
  def change
    add_index :carriages, [:id, :type]
  end
end
