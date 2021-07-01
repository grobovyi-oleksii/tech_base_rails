class AddUserFieldsToTicket < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :first_name_user, :text
    add_column :tickets, :last_name_user, :text
    add_column :tickets, :passport_user, :text
  end
end
