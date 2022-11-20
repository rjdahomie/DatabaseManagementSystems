DROP INDEX IF EXISTS nyc_idx;
DROP INDEX IF EXISTS sfo_idx;
DROP INDEX IF EXISTS color_idx;

CREATE INDEX nyc_idx
ON part_nyc
USING BTREE(on_hand);

CREATE INDEX sfo_idx
ON part_sfo
USING BTREE(supplier, color);

CREATE INDEX color_idx
ON color 
USING BTREE(color_id, color_name);
