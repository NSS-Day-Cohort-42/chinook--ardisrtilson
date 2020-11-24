SELECT COUNT(InvoiceLineId),
i.InvoiceId,
i.CustomerId,
i.InvoiceDate,
i.BillingAddress,
i.BillingCity,
i.BillingState,
i.BillingCountry,
i.BillingPostalCode
FROM 'Invoice' AS i 
JOIN InvoiceLine AS il ON il.InvoiceId = i.InvoiceId
GROUP BY i.InvoiceId