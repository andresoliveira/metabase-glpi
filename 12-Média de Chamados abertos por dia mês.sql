SELECT 
    ROUND(COUNT(glpi_tickets.id) / COUNT(DISTINCT DATE(glpi_tickets.date)), 2) AS Media_Chamados_Por_Dia
FROM glpi_tickets
WHERE glpi_tickets.date IS NOT NULL
  AND [[{{date}}]];

