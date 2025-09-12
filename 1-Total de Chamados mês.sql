SELECT 
    COUNT(id) AS ticketCount 
FROM glpi_tickets 
WHERE status IN (1, 2, 3, 4, 5, 6) 
  AND is_deleted = 0
  AND glpi_tickets.date >= [[{{start_date}}]]  -- data inicial
  AND glpi_tickets.date <= [[{{end_date}}]]    -- data final
