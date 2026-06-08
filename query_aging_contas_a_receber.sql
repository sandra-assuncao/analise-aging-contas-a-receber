SELECT contas_a_receber.Customer,
ROUND(SUM(contas_a_receber.Amount), 2) AS 'Total_Vencido'
FROM contas_a_receber
WHERE contas_a_receber.Status = 'Open'
  AND contas_a_receber.DueDate < '2025-12-31'
GROUP BY contas_a_receber.Customer
ORDER BY Total_Vencido DESC
LIMIT 5;
