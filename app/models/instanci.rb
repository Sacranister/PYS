class Instanci < ActiveRecord::Base
	self.primary_keys = :ins_cod, :ins_cod_prov
	belongs_to :estado_articulo, foreign_key: 'est_art_cod'
	belongs_to :articulo, foreign_key: 'art_cod'
	has_many :detalle_pedidos, foreign_key: 'ins_cod'
	has_many :detalle_documento_de_compras, foreign_key: 'ins_cod' 
	has_many :detalle_sol_devolucions, foreign_key: 'ins_cod'
	has_many :imagens, :dependent => :destroy, foreign_key: 'ins_cod'
	has_many :ins_apvs, :dependent => :destroy, foreign_key: 'ins_cod' 
	has_many :detalle_pedidos, foreign_key: 'ins_cod_prov'
	has_many :detalle_documento_de_compras, foreign_key: 'ins_cod_prov' 
	has_many :detalle_sol_devolucions, foreign_key: 'ins_cod_prov'
	has_many :imagens, :dependent => :destroy, foreign_key: 'ins_cod_prov'
	has_many :ins_apvs, :dependent => :destroy, foreign_key: 'ins_cod_prov'
	accepts_nested_attributes_for :articulo, :reject_if => :all_blank, :allow_destroy => true
	validates :est_art_cod, presence: true
end
