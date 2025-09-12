SELECT 
    COUNT(id) AS ticketCount 
FROM glpi_tickets 
WHERE status IN (5) 
  AND is_deleted = 0
 