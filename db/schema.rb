# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "art_prop_vals", primary_key: "apv_cod", force: :cascade do |t|
    t.integer "val_cod",  null: false
    t.integer "art_cod",  null: false
    t.integer "prop_cod", null: false
  end

  add_index "art_prop_vals", ["apv_cod"], name: "art_prop_vals_pk", unique: true, using: :btree
  add_index "art_prop_vals", ["art_cod"], name: "relationship_58_fk", using: :btree
  add_index "art_prop_vals", ["prop_cod"], name: "relationship_33_fk", using: :btree
  add_index "art_prop_vals", ["val_cod"], name: "relationship_34_fk", using: :btree

  create_table "art_props", primary_key: "art_prop_cod", force: :cascade do |t|
    t.integer "prop_cod", null: false
    t.integer "art_cod",  null: false
  end

  add_index "art_props", ["art_cod"], name: "relationship_31_fk", using: :btree
  add_index "art_props", ["art_prop_cod"], name: "art_props_pk", unique: true, using: :btree
  add_index "art_props", ["prop_cod"], name: "relationship_30_fk", using: :btree

  create_table "articulos", primary_key: "art_cod", force: :cascade do |t|
    t.integer "cat_cod",            null: false
    t.string  "art_nom", limit: 40
  end

  add_index "articulos", ["art_cod"], name: "articulos_pk", unique: true, using: :btree
  add_index "articulos", ["cat_cod"], name: "relationship_53_fk", using: :btree

  create_table "auditoris", primary_key: "aud_cod", force: :cascade do |t|
    t.string "aud_usuario",     limit: 128
    t.date   "aud_fecha"
    t.string "aud_tabla_modif", limit: 128
    t.string "aud_operacion",   limit: 128
    t.string "aud_atri_modif",  limit: 128
    t.string "aud_antes",       limit: 128
    t.string "aud_despues",     limit: 128
  end

  add_index "auditoris", ["aud_cod"], name: "auditorias_pk", unique: true, using: :btree

  create_table "categoris", primary_key: "cat_cod", force: :cascade do |t|
    t.integer "cat_cat_cod"
    t.string  "cat_nom",     limit: 40
  end

  add_index "categoris", ["cat_cat_cod"], name: "relationship_54_fk", using: :btree
  add_index "categoris", ["cat_cod"], name: "categorias_pk", unique: true, using: :btree

  create_table "clientes", primary_key: "cli_cod", force: :cascade do |t|
    t.string "cli_nom",  limit: 40
    t.string "cli_tel",  limit: 40
    t.string "cli_mail", limit: 40
    t.string "cli_rut",  limit: 12
  end

  add_index "clientes", ["cli_cod"], name: "clientes_pk", unique: true, using: :btree

  create_table "detalle_documento_de_compras", id: false, force: :cascade do |t|
    t.integer "doc_com_cod",                       null: false
    t.integer "det_doc_com_linea",                 null: false
    t.integer "ins_cod",                           null: false
    t.string  "ins_cod_prov",           limit: 20, null: false
    t.integer "det_doc_com_cant"
    t.integer "det_doc_com_precio"
    t.integer "det_doc_com_precio_uni"
  end

  add_index "detalle_documento_de_compras", ["doc_com_cod", "det_doc_com_linea"], name: "detalle_documento_de_compras_pk", unique: true, using: :btree
  add_index "detalle_documento_de_compras", ["doc_com_cod"], name: "relationship_12_fk", using: :btree
  add_index "detalle_documento_de_compras", ["ins_cod", "ins_cod_prov"], name: "relationship_7_fk", using: :btree

  create_table "detalle_pedidos", id: false, force: :cascade do |t|
    t.integer "ped_cod",                   null: false
    t.integer "det_ped_linea",             null: false
    t.integer "ins_cod",                   null: false
    t.string  "ins_cod_prov",   limit: 20, null: false
    t.integer "det_ped_cant"
    t.integer "det_ped_precio"
  end

  add_index "detalle_pedidos", ["ins_cod", "ins_cod_prov"], name: "relationship_4_fk", using: :btree
  add_index "detalle_pedidos", ["ped_cod", "det_ped_linea"], name: "detalle_pedidos_pk", unique: true, using: :btree
  add_index "detalle_pedidos", ["ped_cod"], name: "relationship_45_fk", using: :btree

  create_table "detalle_sol_devolucions", id: false, force: :cascade do |t|
    t.integer "sol_dev_cod",                   null: false
    t.integer "det_sol_dev_linea",             null: false
    t.integer "ins_cod",                       null: false
    t.string  "ins_cod_prov",       limit: 20, null: false
    t.integer "det_sol_dev_cant"
    t.integer "det_sol_dev_precio"
  end

  add_index "detalle_sol_devolucions", ["ins_cod", "ins_cod_prov"], name: "relationship_22_fk", using: :btree
  add_index "detalle_sol_devolucions", ["sol_dev_cod", "det_sol_dev_linea"], name: "detalle_sol_devolucions_pk", unique: true, using: :btree
  add_index "detalle_sol_devolucions", ["sol_dev_cod"], name: "relationship_21_fk", using: :btree

  create_table "direccions", primary_key: "dir_cod", force: :cascade do |t|
    t.integer "cli_cod",                  null: false
    t.integer "guia_desp_cod"
    t.string  "dir_calle",     limit: 40
    t.integer "dir_numero"
    t.string  "dir_comuna",    limit: 40
    t.string  "dir_ciudad",    limit: 40
    t.string  "dir_tipo",      limit: 40
  end

  add_index "direccions", ["cli_cod"], name: "relationship_16_fk", using: :btree
  add_index "direccions", ["dir_cod"], name: "direccions_pk", unique: true, using: :btree
  add_index "direccions", ["guia_desp_cod"], name: "relationship_61_fk", using: :btree

  create_table "documento_de_cobros", primary_key: "doc_cob_cod", force: :cascade do |t|
    t.integer "not_cre_cod"
    t.integer "doc_com_cod"
    t.string  "doc_cob_tipo"
  end

  add_index "documento_de_cobros", ["doc_cob_cod"], name: "documento_de_cobros_pk", unique: true, using: :btree
  add_index "documento_de_cobros", ["doc_com_cod"], name: "relationship_41_fk", using: :btree
  add_index "documento_de_cobros", ["not_cre_cod"], name: "relationship_44_fk", using: :btree

  create_table "documento_de_compras", primary_key: "doc_com_cod", force: :cascade do |t|
    t.integer "est_dc_cod",       null: false
    t.integer "ven_cod"
    t.integer "guia_desp_cod"
    t.integer "cli_cod",          null: false
    t.integer "doc_cob_cod",      null: false
    t.date    "doc_com_fecha"
    t.string  "doc_com_met_ent"
    t.string  "doc_com_met_pago"
    t.string  "doc_com_tipo"
  end

  add_index "documento_de_compras", ["cli_cod"], name: "relationship_11_fk", using: :btree
  add_index "documento_de_compras", ["doc_cob_cod"], name: "relationship_40_fk", using: :btree
  add_index "documento_de_compras", ["doc_com_cod"], name: "documento_de_compras_pk", unique: true, using: :btree
  add_index "documento_de_compras", ["est_dc_cod"], name: "relationship_17_fk", using: :btree
  add_index "documento_de_compras", ["guia_desp_cod"], name: "relationship_10_fk", using: :btree
  add_index "documento_de_compras", ["ven_cod"], name: "relationship_59_fk", using: :btree

  create_table "estado_articulos", primary_key: "est_art_cod", force: :cascade do |t|
    t.string "est_art_nom", limit: 40
  end

  add_index "estado_articulos", ["est_art_cod"], name: "estado_articulos_pk", unique: true, using: :btree

  create_table "estado_dcs", primary_key: "est_dc_cod", force: :cascade do |t|
    t.string "est_dc_nom", limit: 40
  end

  add_index "estado_dcs", ["est_dc_cod"], name: "estado_dcs_pk", unique: true, using: :btree

  create_table "estado_pedidos", primary_key: "estado_ped_cod", force: :cascade do |t|
    t.string "estado_ped_nom", limit: 40
  end

  add_index "estado_pedidos", ["estado_ped_cod"], name: "estado_pedidos_pk", unique: true, using: :btree

  create_table "guia_despacho_compras", primary_key: "guia_desp_cod", force: :cascade do |t|
    t.integer "doc_com_cod",     null: false
    t.integer "dir_cod",         null: false
    t.date    "guia_desp_fecha"
  end

  add_index "guia_despacho_compras", ["dir_cod"], name: "relationship_60_fk", using: :btree
  add_index "guia_despacho_compras", ["doc_com_cod"], name: "relationship_9_fk", using: :btree
  add_index "guia_despacho_compras", ["guia_desp_cod"], name: "guia_despacho_compras_pk", unique: true, using: :btree

  create_table "guia_despacho_pedidos", primary_key: "guia_desp_ped_cod", force: :cascade do |t|
    t.integer "ped_cod",             null: false
    t.date    "guia_desp_ped_fecha"
  end

  add_index "guia_despacho_pedidos", ["guia_desp_ped_cod"], name: "guia_despacho_pedidos_pk", unique: true, using: :btree
  add_index "guia_despacho_pedidos", ["ped_cod"], name: "relationship_19_fk", using: :btree

  create_table "historial_estado_dcs", id: false, force: :cascade do |t|
    t.integer "doc_com_cod",                                                                                 null: false
    t.integer "est_dc_cod",                                                                                  null: false
    t.integer "hist_est_dc_cod",   default: "nextval('historial_estado_dcs_hist_est_dc_cod_seq'::regclass)", null: false
    t.date    "hist_est_dc_fecha"
  end

  add_index "historial_estado_dcs", ["doc_com_cod", "est_dc_cod", "hist_est_dc_cod"], name: "historial_estado_dcs_pk", unique: true, using: :btree
  add_index "historial_estado_dcs", ["doc_com_cod"], name: "relationship_38_fk", using: :btree
  add_index "historial_estado_dcs", ["est_dc_cod"], name: "relationship_39_fk", using: :btree

  create_table "historial_estado_pedidos", id: false, force: :cascade do |t|
    t.integer "ped_cod",                                                                                           null: false
    t.integer "estado_ped_cod",                                                                                    null: false
    t.integer "hist_est_ped_cod",   default: "nextval('historial_estado_pedidos_hist_est_ped_cod_seq'::regclass)", null: false
    t.date    "hist_est_ped_fecha"
  end

  add_index "historial_estado_pedidos", ["estado_ped_cod"], name: "relationship_49_fk", using: :btree
  add_index "historial_estado_pedidos", ["ped_cod", "estado_ped_cod", "hist_est_ped_cod"], name: "historial_estado_pedidos_pk", unique: true, using: :btree
  add_index "historial_estado_pedidos", ["ped_cod"], name: "relationship_48_fk", using: :btree

  create_table "imagens", primary_key: "imagen_cod", force: :cascade do |t|
    t.integer "ins_cod",                  null: false
    t.string  "ins_cod_prov", limit: 20,  null: false
    t.string  "imagen_uri",   limit: 140
  end

  add_index "imagens", ["imagen_cod"], name: "imagens_pk", unique: true, using: :btree
  add_index "imagens", ["ins_cod", "ins_cod_prov"], name: "relationship_27_fk", using: :btree

  create_table "ins_apvs", primary_key: "ins_apvs_cod", force: :cascade do |t|
    t.integer "apv_cod",                 null: false
    t.integer "ins_cod",                 null: false
    t.string  "ins_cod_prov", limit: 20, null: false
  end

  add_index "ins_apvs", ["apv_cod"], name: "relationship_57_fk", using: :btree
  add_index "ins_apvs", ["ins_apvs_cod"], name: "ins_apvs_pk", unique: true, using: :btree
  add_index "ins_apvs", ["ins_cod", "ins_cod_prov"], name: "relationship_56_fk", using: :btree

  create_table "instancis", id: false, force: :cascade do |t|
    t.integer "ins_cod",                     default: "nextval('instancis_ins_cod_seq'::regclass)", null: false
    t.string  "ins_cod_prov",     limit: 20,                                                        null: false
    t.integer "est_art_cod",                                                                        null: false
    t.integer "art_cod",                                                                            null: false
    t.integer "ins_stock"
    t.integer "ins_precio_lista"
    t.integer "ins_precio_prov"
  end

  add_index "instancis", ["art_cod"], name: "relationship_62_fk", using: :btree
  add_index "instancis", ["est_art_cod"], name: "relationship_42_fk", using: :btree
  add_index "instancis", ["ins_cod", "ins_cod_prov"], name: "instancias_pk", unique: true, using: :btree

  create_table "nota_creditos", primary_key: "not_cre_cod", force: :cascade do |t|
    t.integer "sol_dev_cod",   null: false
    t.integer "doc_cob_cod",   null: false
    t.integer "not_cre_monto"
  end

  add_index "nota_creditos", ["doc_cob_cod"], name: "relationship_43_fk", using: :btree
  add_index "nota_creditos", ["not_cre_cod"], name: "nota_creditos_pk", unique: true, using: :btree
  add_index "nota_creditos", ["sol_dev_cod"], name: "relationship_15_fk", using: :btree

  create_table "pedidos", primary_key: "ped_cod", force: :cascade do |t|
    t.integer "estado_ped_cod",    null: false
    t.integer "guia_desp_ped_cod"
    t.integer "pro_cod"
    t.date    "ped_fecha"
  end

  add_index "pedidos", ["estado_ped_cod"], name: "relationship_20_fk", using: :btree
  add_index "pedidos", ["guia_desp_ped_cod"], name: "relationship_18_fk", using: :btree
  add_index "pedidos", ["ped_cod"], name: "pedidos_pk", unique: true, using: :btree
  add_index "pedidos", ["pro_cod"], name: "relationship_6_fk", using: :btree

  create_table "propiedad_valors", primary_key: "prop_val_cod", force: :cascade do |t|
    t.integer "val_cod",  null: false
    t.integer "prop_cod", null: false
  end

  add_index "propiedad_valors", ["prop_cod"], name: "relationship_52_fk", using: :btree
  add_index "propiedad_valors", ["prop_val_cod"], name: "propiedad_valors_pk", unique: true, using: :btree
  add_index "propiedad_valors", ["val_cod"], name: "relationship_51_fk", using: :btree

  create_table "propiedads", primary_key: "prop_cod", force: :cascade do |t|
    t.string "prop_nom", limit: 40
  end

  add_index "propiedads", ["prop_cod"], name: "propiedads_pk", unique: true, using: :btree

  create_table "proveedors", primary_key: "pro_cod", force: :cascade do |t|
    t.string "pro_nom",  limit: 40
    t.string "pro_mail", limit: 40
    t.text   "pro_desc"
    t.string "pro_web",  limit: 40
  end

  add_index "proveedors", ["pro_cod"], name: "proveedors_pk", unique: true, using: :btree

  create_table "solicitud_devolucions", primary_key: "sol_dev_cod", force: :cascade do |t|
    t.integer "not_cre_cod"
    t.integer "doc_com_cod"
    t.integer "ven_cod"
    t.integer "cli_cod",                        null: false
    t.string  "sol_dev_comentario", limit: 140
    t.string  "sol_dev_est"
  end

  add_index "solicitud_devolucions", ["cli_cod"], name: "relationship_13_fk", using: :btree
  add_index "solicitud_devolucions", ["doc_com_cod"], name: "relationship_55_fk", using: :btree
  add_index "solicitud_devolucions", ["not_cre_cod"], name: "relationship_14_fk", using: :btree
  add_index "solicitud_devolucions", ["sol_dev_cod"], name: "solicitud_devolucions_pk", unique: true, using: :btree
  add_index "solicitud_devolucions", ["ven_cod"], name: "relationship_25_fk", using: :btree

  create_table "transicion_estado_arts", id: false, force: :cascade do |t|
    t.integer "est_est_art_cod",                                                                                 null: false
    t.integer "est_art_cod",                                                                                     null: false
    t.integer "trans_est_art_cod", default: "nextval('transicion_estado_arts_trans_est_art_cod_seq'::regclass)", null: false
  end

  add_index "transicion_estado_arts", ["est_art_cod"], name: "relationship_50_fk", using: :btree
  add_index "transicion_estado_arts", ["est_est_art_cod", "est_art_cod", "trans_est_art_cod"], name: "transicion_estado_arts_pk", unique: true, using: :btree
  add_index "transicion_estado_arts", ["est_est_art_cod"], name: "relationship_35_fk", using: :btree

  create_table "transicion_estado_dcs", id: false, force: :cascade do |t|
    t.integer "est_est_dc_cod",                                                                               null: false
    t.integer "est_dc_cod",                                                                                   null: false
    t.integer "trans_est_dc_cod", default: "nextval('transicion_estado_dcs_trans_est_dc_cod_seq'::regclass)", null: false
  end

  add_index "transicion_estado_dcs", ["est_dc_cod"], name: "relationship_37_fk", using: :btree
  add_index "transicion_estado_dcs", ["est_est_dc_cod", "est_dc_cod", "trans_est_dc_cod"], name: "transicion_estado_dcs_pk", unique: true, using: :btree
  add_index "transicion_estado_dcs", ["est_est_dc_cod"], name: "relationship_36_fk", using: :btree

  create_table "transicion_estado_pedidos", id: false, force: :cascade do |t|
    t.integer "est_estado_ped_cod",                                                                                  null: false
    t.integer "estado_ped_cod",                                                                                      null: false
    t.integer "trans_est_ped_cod",  default: "nextval('transicion_estado_pedidos_trans_est_ped_cod_seq'::regclass)", null: false
  end

  add_index "transicion_estado_pedidos", ["est_estado_ped_cod", "estado_ped_cod", "trans_est_ped_cod"], name: "transicion_estado_pedidos_pk", unique: true, using: :btree
  add_index "transicion_estado_pedidos", ["est_estado_ped_cod"], name: "relationship_46_fk", using: :btree
  add_index "transicion_estado_pedidos", ["estado_ped_cod"], name: "relationship_47_fk", using: :btree

  create_table "valors", primary_key: "val_cod", force: :cascade do |t|
    t.string "val_nom", limit: 40
  end

  add_index "valors", ["val_cod"], name: "valors_pk", unique: true, using: :btree

  create_table "vendedors", primary_key: "ven_cod", force: :cascade do |t|
    t.string  "ven_nom",  limit: 40
    t.string  "ven_rut",  limit: 12
    t.string  "ven_mail", limit: 40
    t.integer "ven_tel"
  end

  add_index "vendedors", ["ven_cod"], name: "vendedors_pk", unique: true, using: :btree

  add_foreign_key "art_prop_vals", "articulos", column: "art_cod", primary_key: "art_cod", name: "fk_art_prop_relations_articulo", on_update: :restrict, on_delete: :restrict
  add_foreign_key "art_prop_vals", "propiedads", column: "prop_cod", primary_key: "prop_cod", name: "fk_art_prop_relations_propieda", on_update: :restrict, on_delete: :restrict
  add_foreign_key "art_prop_vals", "valors", column: "val_cod", primary_key: "val_cod", name: "fk_art_prop_relations_valors", on_update: :restrict, on_delete: :restrict
  add_foreign_key "art_props", "articulos", column: "art_cod", primary_key: "art_cod", name: "fk_art_prop_relations_articulo", on_update: :restrict, on_delete: :restrict
  add_foreign_key "art_props", "propiedads", column: "prop_cod", primary_key: "prop_cod", name: "fk_art_prop_relations_propieda", on_update: :restrict, on_delete: :restrict
  add_foreign_key "articulos", "categoris", column: "cat_cod", primary_key: "cat_cod", name: "fk_articulo_relations_categori", on_update: :restrict, on_delete: :restrict
  add_foreign_key "categoris", "categoris", column: "cat_cat_cod", primary_key: "cat_cod", name: "fk_categori_relations_categori", on_update: :restrict, on_delete: :restrict
  add_foreign_key "detalle_documento_de_compras", "documento_de_compras", column: "doc_com_cod", primary_key: "doc_com_cod", name: "fk_detalle__relations_document", on_update: :restrict, on_delete: :restrict
  add_foreign_key "detalle_documento_de_compras", "instancis", column: "ins_cod", primary_key: "ins_cod", name: "fk_detalle__relations_instanci", on_update: :restrict, on_delete: :restrict
  add_foreign_key "detalle_pedidos", "instancis", column: "ins_cod", primary_key: "ins_cod", name: "fk_detalle__relations_instanci", on_update: :restrict, on_delete: :restrict
  add_foreign_key "detalle_pedidos", "pedidos", column: "ped_cod", primary_key: "ped_cod", name: "fk_detalle__relations_pedidos", on_update: :restrict, on_delete: :restrict
  add_foreign_key "detalle_sol_devolucions", "instancis", column: "ins_cod", primary_key: "ins_cod", name: "fk_detalle__relations_instanci", on_update: :restrict, on_delete: :restrict
  add_foreign_key "detalle_sol_devolucions", "solicitud_devolucions", column: "sol_dev_cod", primary_key: "sol_dev_cod", name: "fk_detalle__relations_solicitu", on_update: :restrict, on_delete: :restrict
  add_foreign_key "direccions", "clientes", column: "cli_cod", primary_key: "cli_cod", name: "fk_direccio_relations_clientes", on_update: :restrict, on_delete: :restrict
  add_foreign_key "direccions", "guia_despacho_compras", column: "guia_desp_cod", primary_key: "guia_desp_cod", name: "fk_direccio_relations_guia_des", on_update: :restrict, on_delete: :restrict
  add_foreign_key "documento_de_cobros", "documento_de_compras", column: "doc_com_cod", primary_key: "doc_com_cod", name: "fk_document_relations_document", on_update: :restrict, on_delete: :restrict
  add_foreign_key "documento_de_cobros", "nota_creditos", column: "not_cre_cod", primary_key: "not_cre_cod", name: "fk_document_relations_nota_cre", on_update: :restrict, on_delete: :restrict
  add_foreign_key "documento_de_compras", "clientes", column: "cli_cod", primary_key: "cli_cod", name: "fk_document_relations_clientes", on_update: :restrict, on_delete: :restrict
  add_foreign_key "documento_de_compras", "documento_de_cobros", column: "doc_cob_cod", primary_key: "doc_cob_cod", name: "fk_document_relations_document", on_update: :restrict, on_delete: :restrict
  add_foreign_key "documento_de_compras", "estado_dcs", column: "est_dc_cod", primary_key: "est_dc_cod", name: "fk_document_relations_estado_d", on_update: :restrict, on_delete: :restrict
  add_foreign_key "documento_de_compras", "guia_despacho_compras", column: "guia_desp_cod", primary_key: "guia_desp_cod", name: "fk_document_relations_guia_des", on_update: :restrict, on_delete: :restrict
  add_foreign_key "documento_de_compras", "vendedors", column: "ven_cod", primary_key: "ven_cod", name: "fk_document_relations_vendedor", on_update: :restrict, on_delete: :restrict
  add_foreign_key "guia_despacho_compras", "direccions", column: "dir_cod", primary_key: "dir_cod", name: "fk_guia_des_relations_direccio", on_update: :restrict, on_delete: :restrict
  add_foreign_key "guia_despacho_compras", "documento_de_compras", column: "doc_com_cod", primary_key: "doc_com_cod", name: "fk_guia_des_relations_document", on_update: :restrict, on_delete: :restrict
  add_foreign_key "guia_despacho_pedidos", "pedidos", column: "ped_cod", primary_key: "ped_cod", name: "fk_guia_des_relations_pedidos", on_update: :restrict, on_delete: :restrict
  add_foreign_key "historial_estado_dcs", "documento_de_compras", column: "doc_com_cod", primary_key: "doc_com_cod", name: "fk_historia_relations_document", on_update: :restrict, on_delete: :restrict
  add_foreign_key "historial_estado_dcs", "estado_dcs", column: "est_dc_cod", primary_key: "est_dc_cod", name: "fk_historia_relations_estado_d", on_update: :restrict, on_delete: :restrict
  add_foreign_key "historial_estado_pedidos", "estado_pedidos", column: "estado_ped_cod", primary_key: "estado_ped_cod", name: "fk_historia_relations_estado_p", on_update: :restrict, on_delete: :restrict
  add_foreign_key "historial_estado_pedidos", "pedidos", column: "ped_cod", primary_key: "ped_cod", name: "fk_historia_relations_pedidos", on_update: :restrict, on_delete: :restrict
  add_foreign_key "imagens", "instancis", column: "ins_cod", primary_key: "ins_cod", name: "fk_imagens_relations_instanci", on_update: :restrict, on_delete: :restrict
  add_foreign_key "ins_apvs", "art_prop_vals", column: "apv_cod", primary_key: "apv_cod", name: "fk_ins_apvs_relations_art_prop", on_update: :restrict, on_delete: :restrict
  add_foreign_key "ins_apvs", "instancis", column: "ins_cod", primary_key: "ins_cod", name: "fk_ins_apvs_relations_instanci", on_update: :restrict, on_delete: :restrict
  add_foreign_key "instancis", "articulos", column: "art_cod", primary_key: "art_cod", name: "fk_instanci_relations_articulo", on_update: :restrict, on_delete: :restrict
  add_foreign_key "instancis", "estado_articulos", column: "est_art_cod", primary_key: "est_art_cod", name: "fk_instanci_relations_estado_a", on_update: :restrict, on_delete: :restrict
  add_foreign_key "nota_creditos", "documento_de_cobros", column: "doc_cob_cod", primary_key: "doc_cob_cod", name: "fk_nota_cre_relations_document", on_update: :restrict, on_delete: :restrict
  add_foreign_key "nota_creditos", "solicitud_devolucions", column: "sol_dev_cod", primary_key: "sol_dev_cod", name: "fk_nota_cre_relations_solicitu", on_update: :restrict, on_delete: :restrict
  add_foreign_key "pedidos", "estado_pedidos", column: "estado_ped_cod", primary_key: "estado_ped_cod", name: "fk_pedidos_relations_estado_p", on_update: :restrict, on_delete: :restrict
  add_foreign_key "pedidos", "guia_despacho_pedidos", column: "guia_desp_ped_cod", primary_key: "guia_desp_ped_cod", name: "fk_pedidos_relations_guia_des", on_update: :restrict, on_delete: :restrict
  add_foreign_key "pedidos", "proveedors", column: "pro_cod", primary_key: "pro_cod", name: "fk_pedidos_relations_proveedo", on_update: :restrict, on_delete: :restrict
  add_foreign_key "propiedad_valors", "propiedads", column: "prop_cod", primary_key: "prop_cod", name: "fk_propieda_relations_propieda", on_update: :restrict, on_delete: :restrict
  add_foreign_key "propiedad_valors", "valors", column: "val_cod", primary_key: "val_cod", name: "fk_propieda_relations_valors", on_update: :restrict, on_delete: :restrict
  add_foreign_key "solicitud_devolucions", "clientes", column: "cli_cod", primary_key: "cli_cod", name: "fk_solicitu_relations_clientes", on_update: :restrict, on_delete: :restrict
  add_foreign_key "solicitud_devolucions", "documento_de_compras", column: "doc_com_cod", primary_key: "doc_com_cod", name: "fk_solicitu_relations_document", on_update: :restrict, on_delete: :restrict
  add_foreign_key "solicitud_devolucions", "nota_creditos", column: "not_cre_cod", primary_key: "not_cre_cod", name: "fk_solicitu_relations_nota_cre", on_update: :restrict, on_delete: :restrict
  add_foreign_key "solicitud_devolucions", "vendedors", column: "ven_cod", primary_key: "ven_cod", name: "fk_solicitu_relations_vendedor", on_update: :restrict, on_delete: :restrict
  add_foreign_key "transicion_estado_arts", "estado_articulos", column: "est_art_cod", primary_key: "est_art_cod", name: "fk_transici_relations_estado_a", on_update: :restrict, on_delete: :restrict
  add_foreign_key "transicion_estado_arts", "estado_articulos", column: "est_est_art_cod", primary_key: "est_art_cod", name: "fk_transici_relations_estado_a1", on_update: :restrict, on_delete: :restrict
  add_foreign_key "transicion_estado_dcs", "estado_dcs", column: "est_dc_cod", primary_key: "est_dc_cod", name: "fk_transici_relations_estado_d", on_update: :restrict, on_delete: :restrict
  add_foreign_key "transicion_estado_dcs", "estado_dcs", column: "est_est_dc_cod", primary_key: "est_dc_cod", name: "fk_transici_relations_estado_d1", on_update: :restrict, on_delete: :restrict
  add_foreign_key "transicion_estado_pedidos", "estado_pedidos", column: "est_estado_ped_cod", primary_key: "estado_ped_cod", name: "fk_transici_relations_estado_p1", on_update: :restrict, on_delete: :restrict
  add_foreign_key "transicion_estado_pedidos", "estado_pedidos", column: "estado_ped_cod", primary_key: "estado_ped_cod", name: "fk_transici_relations_estado_p", on_update: :restrict, on_delete: :restrict
end
