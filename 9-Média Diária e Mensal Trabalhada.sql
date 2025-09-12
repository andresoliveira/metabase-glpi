SELECT 
    DATE_FORMAT(task.date, '%m-%Y') AS Mes,
    CONCAT(TIME_FORMAT(SEC_TO_TIME(AVG(task.actiontime)), '%H:%i'), 'h') AS Media Diaria,    -- média diária HH:MM
    CONCAT(TIME_FORMAT(SEC_TO_TIME(SUM(task.actiontime) / COUNT(DISTINCT DATE(task.date))), '%H:%i'), 'h') AS Media Mensal  -- média mensal HH:MM
FROM glpi_tickettasks task
INNER JOIN glpi_tickets t
    ON t.id = task.tickets_id
INNER JOIN glpi_tickets_users tu
    ON tu.tickets_id = t.id AND tu.type = 2
WHERE tu.users_id = 852
  AND t.status IN (2,3,4,5,6)                -- apenas fechados/solucionados
  AND task.actiontime IS NOT NULL
  AND task.date >= [[{{start_date}}]]  -- data inicial
  AND task.date <= [[{{end_date}}]]    -- data final
GROUP BY Mes
ORDER BY Mes DESC;
