# Consultas Metabase - GLPI

## Estrutura Geral por Mês
1- `1-Total de Chamados mês.sql` – Total de chamados abertos no mês

2- `2-Chamados Fechados mês.sql` – Total de chamados com status fechados no mês

3- `3-Chamados Solucionados mês.sql` – Total de chamados com status solucionados no mês

4- `4-Chamados Novos mês.sql` – Total de chamados com status aberto no mês

5- `5-Chamados Atribuidos. mês.sql` – Total de chamados com status Atribuidos no mês

6- `6-Chamados Planejados mês.sql` – Total de chamados com status Planejados no mês

7- `7-Chamados Pendentes mês.sql` – Total de chamados com status Pendentes no mês

8- `8-Chamados não Solucionados mês.sql` – Total de chamados com status Solucionados no mês

9- `9-Prioridade de Chamados mês.sql` – Quantidade de chamados por Prioridade (Alta, Média e Baixa)

10- `10-Tipos de Chamados mês.sql` – Quatidade de chamados por tipo Requicição e Incidente no mês

11- `11-Média de Chamados fechados por dia mês.sql` – Média de chamados fechados por dia no mês

12- `12-Média de Chamados abertos por dia mês.sql` – Média de chamados abertos por dia no mês

13- `13-Média Diária e Mensal Trabalhada mês.sql` – Média Diária e Mensal Trabalhada mês

14- `14-Rendimento Geral técnicos por mês.sql` – Rendimentos dos técnicos por mês com indicador -> *AND tu.users_id IN (ID dos técnicos)  -- técnicos específicos

15- `15-Rendimento Geral técnicos por mês - grafico barra.sql` – Rendimentos dos técnicos por mês em gráfico em barras -> *AND tu.users_id IN (ID dos técnicos)  -- técnicos específicos

16- `16-Total Chamados por técnico mês-gráfico.sql` – Total de chamados percentual por técnico no mês  -> *AND tu2.users_id IN (ID dos técnicos)  e AND tu.users_id IN (ID dos técnicos)

17- `17-Top 10 Chamados por Categoria.sql` – Top 10 chamados por categoria

18- `18-Top 10 por Localização.sql` – Top 10 chamados por Localização

## Estrutura Por Técnico no Mês

1- `1-Total Chamados Atendidos` – Total Geral de chamados atendidos -> *AND tu.users_id = ID no Técnico

2- `2-Chamados Pendentes.sql` – Total de chamados Pendentes -> *AND tu.users_id = ID no Técnico 

3- `3-Chamados Planejados.sql` – Total de chamados Pendentes -> *AND tu.users_id = ID no Técnico

4- `4-Chamados Atribuídos.sql` – Total de chamados Atrubuidos -> *AND tu.users_id = ID no Técnico

5- `5-Chamados não Solucionados.sql` – Total de chamados Não Solucionados -> *AND tu.users_id = ID no Técnico

6- `6-Chamados no mês.sql` – Total de chamados Atendidos no mês -> *AND tu.users_id = ID no Técnico

7- `7-7-Chamados Atendidos.sql` – Total de chamados Solucionados + fechados no mês -> *AND tu.users_id = ID no Técnico

8- `8-Rendimento.sql` – Redimento do técnico em percentual no mês -> *WHERE tu.users_id = ID no Técnico

9- `9-Média Diária e Mensal Trabalhada.sql` – Média Diária e Mensal Trabalhada -> *WHERE tu.users_id = ID no Técnico

10- `10-Chamados sem Interação.sql` – Chamados sem interação
