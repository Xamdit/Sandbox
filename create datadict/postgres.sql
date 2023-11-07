-- Change to your schema name
SET
  search_path TO 'document';

WITH vars AS (
  SELECT
    current_schema() AS v_SchemaName,
    -- Changed to PostgreSQL equivalent
    'NO' AS v_TablesOnly -- YES=Limit To Tables only; NO=Include views too
),
baseTbl AS (
  SELECT
    table_schema,
    table_catalog,
    table_name,
    table_type
  FROM
    information_schema.tables
  WHERE
    table_schema = (
      SELECT
        v_SchemaName
      FROM
        vars
    )
    AND (
      table_type = 'BASE TABLE'
      OR (
        SELECT
          v_TablesOnly
        FROM
          vars
      ) = 'NO'
    )
),
metadata AS (
  SELECT
    bt.table_schema AS schema_nm,
    bt.table_name,
    CASE
      WHEN bt.table_type = 'BASE TABLE' THEN 'TBL'
      WHEN bt.table_type = 'VIEW' THEN 'VW'
      ELSE 'UK'
    END AS obj_typ,
    c.ordinal_position,
    c.column_name,
    data_type || coalesce('(' || character_maximum_length || ')', '') AS data_typ,
    CASE
      WHEN is_nullable = 'YES' THEN 'NULL'
      ELSE 'NOT NULL'
    END AS nullable
  FROM
    information_schema.columns c
    INNER JOIN baseTbl bt ON bt.table_name = c.table_name
    AND bt.table_schema = c.table_schema
),
meta_for_keys AS (
  SELECT
    tc.table_schema AS schema_nm,
    tc.table_name,
    kcu.column_name,
    string_agg(distinct tc.constraint_type, ',') FILTER (
      WHERE
        tc.constraint_type IN ('PRIMARY KEY', 'UNIQUE', 'FOREIGN KEY')
    ) AS is_key
  FROM
    information_schema.table_constraints tc
    JOIN information_schema.key_column_usage kcu ON kcu.constraint_name = tc.constraint_name
    AND kcu.table_schema = tc.table_schema
    AND kcu.table_name = tc.table_name
  WHERE
    tc.table_schema = (
      SELECT
        v_SchemaName
      FROM
        vars
    )
    AND tc.table_name IN (
      SELECT
        table_name
      FROM
        baseTbl
    )
    AND tc.constraint_type IN ('PRIMARY KEY', 'FOREIGN KEY', 'UNIQUE')
  GROUP BY
    tc.table_schema,
    tc.table_name,
    kcu.column_name
),
col_comm AS (
  SELECT
    c.table_schema AS schema_nm,
    c.table_name,
    c.column_name,
    pgd.description AS column_descr
  FROM
    information_schema.columns c
    LEFT JOIN pg_catalog.pg_statio_all_tables st ON st.schemaname = c.table_schema
    AND st.relname = c.table_name
    LEFT JOIN pg_catalog.pg_description pgd ON pgd.objoid = st.relid
    AND pgd.objsubid = c.ordinal_position
  WHERE
    c.table_schema = (
      SELECT
        v_SchemaName
      FROM
        vars
    )
    AND c.table_name IN (
      SELECT
        table_name
      FROM
        baseTbl
    )
)
SELECT
  md.schema_nm,
  md.table_name AS table_nm,
  md.obj_typ,
  md.ordinal_position AS ord,
  COALESCE(pk.is_key, ' ') AS is_key,
  md.column_name AS column_nm,
  md.data_typ,
  md.nullable,
  c.column_descr
FROM
  metadata md
  LEFT JOIN meta_for_keys pk ON pk.schema_nm = md.schema_nm
  AND pk.table_name = md.table_name
  AND pk.column_name = md.column_name
  LEFT JOIN col_comm c ON c.schema_nm = md.schema_nm
  AND c.table_name = md.table_name
  AND c.column_name = md.column_name
ORDER BY
  md.schema_nm,
  md.table_name,
  md.ordinal_position;