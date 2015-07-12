class Instanci < ActiveRecord::Base
	self.primary_keys = :ins_cod, :ins_cod_prov
	belongs_to :estado_articulo, foreign_key: 'est_art_cod'
	belongs_to :articulo, foreign_key: 'art_cod'
	has_many :detalle_pedidos, :dependent => :destroy 
	has_many :detalle_documento_de_compras, :dependent => :destroy 
	has_many :detalle_sol_devolucions, :dependent => :destroy 
	has_many :imagens, :dependent => :destroy 
	has_many :ins_apvs, :dependent => :destroy 
end
