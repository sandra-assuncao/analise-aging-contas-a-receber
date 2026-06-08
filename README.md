# analise-aging-contas-a-receber
Query em SQL (MySQL) desenvolvida para analisar faturas vencidas e identificar o risco de inadimplência por cliente.

## 📌 Contexto de Negócio
Manter o controle do fluxo de caixa exige visibilidade constante sobre o *Aging* (Envelhecimento) de Contas a Receber. Para a gestão financeira e tesouraria, identificar rapidamente quais clientes concentram os maiores volumes de faturas vencidas é crucial para acionar as equipes de cobrança de forma estratégica e mitigar o risco de crédito.

Esta query em SQL analisa uma base de dados transacional de Contas a Receber para extrair os **Top 5 clientes com o maior volume financeiro inadimplente** (faturas com status 'Open' e data de vencimento retroativa).

## 🛠️ Tecnologias Utilizadas
* **SQL (MySQL)**
* Funções agregadas (`SUM`, `COUNT`) e filtros condicionais lógicos.

## 📈 A Query Utilizada
```sql
SELECT contas_a_receber.Customer,
ROUND(SUM(contas_a_receber.Amount), 2) AS 'Total_Vencido'
FROM contas_a_receber
WHERE contas_a_receber.Status = 'Open'
  AND contas_a_receber.DueDate < '2025-12-31'
GROUP BY contas_a_receber.Customer
ORDER BY Total_Vencido DESC
LIMIT 5;
