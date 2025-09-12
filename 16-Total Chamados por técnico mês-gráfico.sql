SELECT 
    CONCAT(u.firstname, ' ', u.realname) AS Tecnico,
    COUNT(t.id) AS Total_Absorcao,
    CONCAT(ROUND((COUNT(t.id) * 100.0) / 
           (SELECT COUNT(*) 
            FROM glpi_tickets t2
            INNER JOIN glpi_tickets_users tu2 
                ON tu2.tickets_id = t2.id 
               AND tu2.type = 2
            WHERE t2.is_deleted = 0
              AND t2.status IN (1,2,3,4,5,6)
              AND t2.date >= [[{{start_date}}]]
              AND t2.date <= [[{{end_date}}]]
              AND tu2.users_id IN (852, 352, 705, 166, 344, 816, 863, 349)
           ),2), '%') AS Percentual
FROM glpi_tickets t
INNER JOIN glpi_tickets_users tu 
    ON tu.tickets_id = t.id 
   AND tu.type = 2
INNER JOIN glpi_users u 
    ON u.id = tu.users_id
WHERE t.is_deleted = 0
  AND t.status IN (1,2,3,4,5,6)
  AND t.date >= [[{{start_date}}]]
  AND t.date <= [[{{end_date}}]]
  AND tu.users_id IN (852, 352, 705, 166, 344, 816, 863, 349)
GROUP BY u.id, u.firstname, u.realname
ORDER BY Total_Absorcao DESC;
