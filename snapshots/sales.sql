{% snapshot sales %}

    {{
        config(
            target_database = 'streams_db',
            target_schema = 'public',
            unique_key='id',
            strategy='timestamp',
            updated_at='updated_at',
            invalidate_hard_deletes=true
        )
    }}

with sales as (

    select
         id,
         product,
         price,
         amount,
         store_id,
         updated_at
    from streams_db.public.sales_raw_staging
    --from {{ source('src_sales', 'sales_stream') }}
   -- where metadata$action = 'INSERT'

)

select * from sales

{% endsnapshot %}