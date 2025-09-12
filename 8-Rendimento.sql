SELECT 
    DATE_FORMAT(t.date, '%m-%Y') AS Mes,          -- agrupa por mês/ano
    COUNT(CASE WHEN t.status IN (5,6) THEN 1 END) AS Chamados Fechados,
    COUNT(CASE WHEN t.status IN (1,2,3,4,5,6) THEN 1 END) AS Chamados Atendidos,
    CONCAT(
        ROUND(
            (COUNT(CASE WHEN t.status IN (5,6) THEN 1 END) * 100.0) /
            NULLIF(COUNT(CASE WHEN t.status IN (1,2,3,4,5,6) THEN 1 END),0)
        ,2), '%'
    ) AS Rendimento Percentual,
    CASE 
        WHEN ROUND((COUNT(CASE WHEN t.status IN (5,6) THEN 1 END) * 100.0) /
                   NULLIF(COUNT(CASE WHEN t.status IN (1,2,3,4,5,6) THEN 1 END),0), 2) < 90 
            THEN '🔴'
        WHEN ROUND((COUNT(CASE WHEN t.status IN (5,6) THEN 1 END) * 100.0) /
                   NULLIF(COUNT(CASE WHEN t.status IN (1,2,3,4,5,6) THEN 1 END),0), 2) < 95 
            THEN '🟡'
        ELSE '🟢'
    END AS Indicador
FROM glpi_tickets t
INNER JOIN glpi_tickets_users tu
    ON tu.tickets_id = t.id 
   AND tu.type = 2                  -- técnicos atribuídos
WHERE t.status IN (1,2,3,4,5,6)
  AND t.is_deleted = 0
  AND tu.users_id = 852             -- técnico específico
  AND t.date >= [[{{start_date}}]]  -- data inicial
  AND t.date <= [[{{end_date}}]]    -- data final
GROUP BY Mes
ORDER BY Mes DESC;
