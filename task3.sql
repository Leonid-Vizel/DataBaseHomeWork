SELECT * FROM "Professions" as p
WHERE NOT EXISTS (
    SELECT "Id"
    FROM "Tarifs" as t
    WHERE NOT EXISTS (
        SELECT "Id"
        FROM "Norms" n
        WHERE n."ProfessionId" = p."Id" AND n."TarifId" = t."Id"
    )
);
