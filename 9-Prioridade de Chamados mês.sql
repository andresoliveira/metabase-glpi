SELECT
	COUNT(ID),
	CASE
		WHEN priority = 6 and is_deleted = 0 THEN 'Critica'
		WHEN priority = 5 and is_deleted = 0 THEN 'Muito Alta'
		WHEN priority = 4 and is_deleted = 0 THEN 'Alta'
		WHEN priority = 3 and is_deleted = 0 THEN 'Média'
		WHEN priority = 2 and is_deleted = 0 THEN 'Baixa'
		WHEN priority = 1 and is_deleted = 0 THEN 'Muito Baixa'
	END AS urgencia
FROM
glpi_tickets where status in (1, 2, 3, 4, 5, 6) and `glpi_tickets`.`is_deleted` = 0 AND [[{{date}}]]
GROUP BY
	priority