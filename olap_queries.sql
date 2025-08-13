-- 1. ROLL-UP: Total sales by Country and Quarter
SELECT 
    c.Country,
    t.Year,
    t.Quarter,
    SUM(sf.Quantity * p.UnitPrice) AS TotalSales
FROM SalesFact sf
JOIN CustomerDim c ON sf.CustomerKey = c.CustomerKey
JOIN TimeDim t ON sf.DateKey = t.DateKey
JOIN ProductDim p ON sf.ProductKey = p.ProductKey
GROUP BY c.Country, t.Year, t.Quarter
ORDER BY c.Country, t.Year, t.Quarter;

-- 2. DRILL-DOWN: Sales details for a specific country (e.g., UK) by Month
SELECT 
    t.Year,
    t.Month,
    SUM(sf.Quantity * p.UnitPrice) AS MonthlySales
FROM SalesFact sf
JOIN CustomerDim c ON sf.CustomerKey = c.CustomerKey
JOIN TimeDim t ON sf.DateKey = t.DateKey
JOIN ProductDim p ON sf.ProductKey = p.ProductKey
WHERE c.Country = 'China'
GROUP BY t.Year, t.Month
ORDER BY t.Year, t.Month;

-- 3. SLICE: Total sales for Electronics category
SELECT 
    p.Category,
    SUM(sf.Quantity * p.UnitPrice) AS TotalElectronicsSales
FROM SalesFact sf
JOIN ProductDim p ON sf.ProductKey = p.ProductKey
WHERE p.Category = 'Electronics'
GROUP BY p.Category;
