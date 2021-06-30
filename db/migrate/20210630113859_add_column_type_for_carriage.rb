class AddColumnTypeForCarriage < ActiveRecord::Migration[6.1]
  def change
    remove_column :carriages, :kind
    add_column :carriages, :type, :string
  end
end
