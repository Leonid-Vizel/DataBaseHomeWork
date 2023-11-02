SELECT n."PartId", n."OperationId", n."ProfessionId", t."PerHour" AS "TarifPerHour"
FROM "Norms" AS n
INNER JOIN "Tarifs" AS t ON n."TarifId" = t."Id"
WHERE n."ProfessionId" = 1;
