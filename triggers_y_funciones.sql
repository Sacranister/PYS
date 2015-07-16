CREATE OR REPLACE FUNCTION estado_dc_history() returns TRIGGER AS $$
BEGIN
  INSERT INTO historial_estado_dcs(doc_com_cod,est_dc_cod,hist_est_dc_cod,hist_est_dc_fecha)
  VALUES(OLD.doc_com_cod
    ,OLD.est_dc_cod
    ,NEW.est_dc_cod
    ,CURRENT_TIMESTAMP);
  RETURN null;
END;
$$ 
language 'plpgsql';

CREATE TRIGGER tgr_hist_dc 
AFTER UPDATE OF est_dc_cod
ON documento_de_compras 
FOR EACH ROW
  EXECUTE PROCEDURE estado_dc_history();

CREATE OR REPLACE FUNCTION estado_ped_history() returns TRIGGER AS $$
BEGIN
  INSERT INTO historial_estado_pedidos(ped_cod,estado_ped_cod,hist_est_ped_cod,hist_est_ped_fecha)
  VALUES(OLD.ped_cod,OLD.estado_ped_cod
    ,NEW.estado_ped_cod
    ,CURRENT_TIMESTAMP);
  RETURN null;
END;
$$ 
language 'plpgsql';

CREATE TRIGGER tgr_hist_ped
AFTER UPDATE OF estado_ped_cod
ON pedidos
FOR EACH ROW
  EXECUTE PROCEDURE estado_ped_history();