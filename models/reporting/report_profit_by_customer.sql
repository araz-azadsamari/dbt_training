select CUSTOMERID,SEGMENT,COUNTRY
,sum(orderprofit) as profit
from {{ ref('stg_orders') }}
group by CUSTOMERID,SEGMENT,COUNTRY