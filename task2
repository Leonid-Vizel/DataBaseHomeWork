SELECT p."Id",
    (SELECT n."FinalMinuteTime" / 60.0 * t."PerHour"
    FROM "Norms" AS n
    INNER JOIN "Tarifs" AS t ON n."TarifId" = t."Id"
    WHERE p."Id" = n."PartId") AS "FinalWorkPrice",
	(SELECT m."PlanPrice" * o."NeededAmount"::numeric
    FROM "Norms" AS n0
    INNER JOIN "Operations" AS o ON n0."OperationId" = o."Id"
    INNER JOIN "Materials" AS m ON o."MaterialId" = m."Id"
    WHERE p."Id" = n0."PartId") AS "MaterialPrice"
FROM "Parts" AS p;
