select 
--from raw_orders
o.orderid,o.orderdate,o.shipdate,o.shipmode,
o.ORDERSELLINGPRICE - o.ORDERCOSTPRICE as orderprofit
,o.ORDERSELLINGPRICE ,o.ORDERCOSTPRICE
--from raw_customer
,c.CUSTOMERID,c.CUSTOMERNAME,c.SEGMENT,c.COUNTRY
--from raw_product
,p.productid,p.CATEGORY,p.PRODUCTNAME,p.SUBCATEGORY,
{{markup()}} as markup
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c
on o.CUSTOMERID=c.CUSTOMERID
left join {{ ref('raw_product') }} as p
on o.productid=p.productid
{{limit_data_in_dev(orderdate)}}
