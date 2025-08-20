select 
--from raw_orders
o.orderid,o.orderdate,o.shipdate,o.shipmode,
o.ORDERSELLINGPRICE - o.ORDERCOSTPRICE as orderprofit
,o.ORDERSELLINGPRICE ,o.ORDERCOSTPRICE
--from raw_customer
,c.CUSTOMERNAME,c.SEGMENT,c.COUNTRY
--from raw_product
,p.CATEGORY,p.PRODUCTNAME,p.SUBCATEGORY
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c
on o.CUSTOMERID=c.CUSTOMERID
left join {{ ref('raw_product') }} as p
on o.productid=p.productid
