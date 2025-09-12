SELECT 
    loc.completename AS Localizacao,
    COUNT(t.id) AS Total_Chamados
FROM glpi_tickets t
LEFT JOIN glpi_locations loc
    ON loc.id = t.locations_id
WHERE t.is_deleted = 0
  AND t.status IN (1,2,3,4,5,6)        -- todos os chamados
  AND t.date >= [[{{start_date}}]]      -- data inicial
  AND t.date <= [[{{end_date}}]]        -- data final
GROUP BY loc.id, loc.completename
ORDER BY Total_Chamados DESC
LIMIT 10;
