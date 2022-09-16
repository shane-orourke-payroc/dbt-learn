with tables as (
    select * from {{ ref('stg_tables') }}
),
table_constaints as (
    select * from {{ ref('stg_table_constraints')}}
)
select t.TABLE_CATALOG
, t.TABLE_SCHEMA
, t.TABLE_NAME
, t.TABLE_OWNER
, t.TABLE_TYPE
, t.IS_TRANSIENT
, t.CLUSTERING_KEY
, t.ROW_COUNT
, t.BYTES
, t.RETENTION_TIME
, tc.CONSTRAINT_NAME
, tc.CONSTRAINT_TYPE
, tc.IS_DEFERRABLE
, tc.INITIALLY_DEFERRED
, tc.ENFORCED
, tc.COMMENT
, tc.CREATED
, tc.LAST_ALTERED
, tc.RELY 
from tables t
    inner join table_constaints tc
        on t.table_catalog = tc.table_catalog
        and t.table_schema = tc.table_schema
        and t.table_name = tc.table_name
