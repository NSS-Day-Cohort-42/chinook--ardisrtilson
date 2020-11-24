SELECT COUNT(InvoiceId) AS "Line Items Total"
FROM InvoiceLine il
GROUP BY InvoiceId