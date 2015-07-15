class Addfechatosoldev < ActiveRecord::Migration
  def change
  	add_column :solicitud_devolucions, :sol_dev_fecha, :date
  end
end
