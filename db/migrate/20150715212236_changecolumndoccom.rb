class Changecolumndoccom < ActiveRecord::Migration
  def change
  	change_column :documento_de_compras, :cli_cod, :integer, :null => true
  end
end
