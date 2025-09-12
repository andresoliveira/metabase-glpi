SELECT COUNT(t.id) AS ticketCount
FROM glpi_tickets t
INNER JOIN glpi_tickets_users tu
    ON tu.tickets_id = t.id AND tu.type = 2   -- técnicos atribuídos
WHERE t.status IN (3)
  AND t.is_deleted = 0
  AND tu.users_id = 852                      -- técnico específico
  
