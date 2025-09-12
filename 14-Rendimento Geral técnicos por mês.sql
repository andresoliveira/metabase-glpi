SELECT 
    DATE_FORMAT(t.date, '%m-%Y') AS Mes,          -- agrupa por mês/ano
    CONCAT(u.firstname, ' ', u.realname) AS Tecnico_Responsavel,
    COUNT(CASE WHEN t.status IN (5,6) THEN 1 END) AS Chamados_Fechados,
    COUNT(CASE WHEN t.status IN (1,2,3,4,5,6) THEN 1 END) AS Chamados_Atendidos,
    CONCAT(
        ROUND(
            (COUNT(CASE WHEN t.status IN (5,6) THEN 1 END) * 100.0) /
            NULLIF(COUNT(CASE WHEN t.status IN (1,2,3,4,5,6) THEN 1 END),0)
        ,2), '%'
    ) AS Rendimento_Percentual,
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
INNER JOIN glpi_users u
    ON u.id = tu.users_id
WHERE t.status IN (1,2,3,4,5,6)
  AND t.is_deleted = 0
  AND tu.users_id IN (852, 352, 705, 166, 344, 816, 863, 349)  -- técnicos específicos
  AND t.date >= [[{{start_date}}]]  -- data inicial
  AND t.date <= [[{{end_date}}]]    -- data final
GROUP BY Mes, u.id, u.firstname, u.realname
ORDER BY Mes DESC, Tecnico_Responsavel;
