select productid,PRODUCTNAME,CATEGORY,SUBCATEGORY
    ,sum(orderprofit) as profit
from {{ ref('stg_orders') }}
group by productid,PRODUCTNAME,CATEGORY,SUBCATEGORY