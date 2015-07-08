class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cli_nom, :string
    add_column :users, :cli_rut, :string
    add_column :users, :cli_tel, :integer
  end
end
