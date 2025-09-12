SELECT
		COUNT (ID),
		CASE
			WHEN type = 1 THEN 'Incidente'
			WHEN type = 2 THEN 'Requsição' END AS TIPOS DE CHAMADOS	
			
FROM
		glpi_tickets where status in (1, 2, 3, 4, 5, 6) and `glpi_tickets`.`is_deleted` = 0 AND [[{{date}}]]

GROUP BY
		TIPOS DE CHAMADOS