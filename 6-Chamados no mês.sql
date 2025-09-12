SELECT COUNT(t.id) AS ticketCount
FROM glpi_tickets t
INNER JOIN glpi_tickets_users tu
    ON tu.tickets_id = t.id AND tu.type = 2   -- técnicos atribuídos
WHERE t.status IN (1,2,3,4,5,6)
  AND t.is_deleted = 0
  AND tu.users_id = 852                      -- técnico específico
    AND t.date >= [[{{start_date}}]]           -- data inicial dinâmica
  AND t.date <= [[{{end_date}}]];            -- data final dinâmica
