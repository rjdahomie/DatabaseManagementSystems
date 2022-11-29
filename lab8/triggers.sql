CREATE OR REPLACE LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION set_part_number()
	RETURNS "trigger" AS
	$BODY$
	BEGIN
		NEW.part_number = nextval('part_number_seq');
		RETURN NEW;
	END;
	$BODY$
	LANGUAGE plpgsql VOLATILE;

DROP TRIGGER IF EXISTS part_number_trigger ON part_nyc;

CREATE TRIGGER part_number_trigger
BEFORE INSERT
ON part_nyc
FOR EACH ROW
EXECUTE PROCEDURE set_part_number(part_number_seq);
