SELECT 
    DATE_FORMAT(closedate, '%Y-%m') AS Mes,
    ROUND(COUNT(id) / COUNT(DISTINCT DATE(closedate)), 2) AS media_por_dia
FROM glpi_tickets
WHERE status IN (5,6) AND [[{{date}}]]
  AND closedate IS NOT NULL
GROUP BY DATE_FORMAT(closedate, '%Y-%m')
ORDER BY Mes DESC;
