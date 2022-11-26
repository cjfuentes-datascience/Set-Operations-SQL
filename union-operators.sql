-- Select ten rows from the new_products table.
SELECT *
FROM new_products
LIMIT 10;

-- Select a complete list of brand names from the legacy_products and new_products tables.
SELECT brand
FROM legacy_products
UNION
SELECT brand
FROM new_products;

-- Using the same pattern, utilize a subquery to find the average sale price over both order_items and order_items_historic tables.
SELECT a.id, AVG(a.sale_price) 
FROM (
  SELECT id, sale_price
  FROM order_items
  UNION ALL 
  SELECT id, sale_price
  FROM order_items_historic
) as a
GROUP BY 1;

-- Select the items in the category column that are both in the newly acquired new_products table and the legacy_products table.
SELECT category 
FROM new_products
INTERSECT
SELECT category
FROM legacy_products;

-- Conversely, select the items in the category column that are in the legacy_products table and not in the new_products table.
SELECT category 
FROM legacy_products
EXCEPT
SELECT category
FROM new_products;
