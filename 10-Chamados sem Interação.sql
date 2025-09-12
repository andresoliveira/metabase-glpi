SELECT 
    t.id AS Chamado_ID,
    t.name AS Titulo,
    CONCAT(u.firstname, ' ', u.realname) AS Tecnico_Responsavel,
    t.date AS Data_Abertura,
    t.date_mod AS Ultima_Interacao,
    DATEDIFF(NOW(), t.date_mod) AS Dias_Sem_Interacao,
    CASE t.status
        WHEN 1 THEN 'Novo'
        WHEN 2 THEN 'Em andamento (atribuído)'
        WHEN 3 THEN 'Em andamento (planejado)'
        WHEN 4 THEN 'Pendente'
        ELSE 'Outro'
    END AS Status_Chamado,
    CASE 
        WHEN DATEDIFF(NOW(), t.date_mod) > 20 THEN '🔴 Mais de 20 dias sem interação'
        WHEN DATEDIFF(NOW(), t.date_mod) > 10 THEN '🟡 Atenção: 10-20 dias sem interação'
        ELSE '🟢 Dentro do prazo'
    END AS Indicador
FROM glpi_tickets t
INNER JOIN glpi_tickets_users tu
    ON tu.tickets_id = t.id AND tu.type = 2
INNER JOIN glpi_users u
    ON u.id = tu.users_id
WHERE tu.users_id = 852                  -- técnico específico
  AND t.is_deleted = 0
  AND t.status IN (1,2,3,4)             -- abertos e pendentes
ORDER BY Dias_Sem_Interacao DESC;
