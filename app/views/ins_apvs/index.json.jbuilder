json.array!(@ins_apvs) do |ins_apv|
  json.extract! ins_apv, :id, :apv_cod, :ins_cod, :ins_cod_prov
  json.url ins_apv_url(ins_apv, format: :json)
end
