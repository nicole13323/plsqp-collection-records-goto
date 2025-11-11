SET SERVEROUTPUT ON;

-- Associative array example: city populations
DECLARE
  TYPE population_t IS TABLE OF NUMBER INDEX BY VARCHAR2(64);
  city_population population_t;
  v_city VARCHAR2(64);
BEGIN
  city_population('Kigali') := 1200000;
  city_population('Musanze') := 450000;
  city_population('Huye') := 120000;

  v_city := 'Kigali';
  DBMS_OUTPUT.PUT_LINE('Population of ' || v_city || ': ' || city_population(v_city));

  -- loop over a known list of keys
  FOR c IN (SELECT 'Kigali' AS k FROM DUAL UNION ALL SELECT 'Musanze' FROM DUAL UNION ALL SELECT 'Huye' FROM DUAL) LOOP
     DBMS_OUTPUT.PUT_LINE(c.k || ' => ' || city_population(c.k));
  END LOOP;
END;
/
