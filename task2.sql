-- =======
-- Задание #2
-- Для каждой детали: код детали; стоимость подготовительно-заключительных работ; стоимость на штуку (суммарно по всем операциям).
-- =======
-- 1) Подключаемся к таблице "Parts" и берём из неё код детали
-- 2) К ней подключаем таблицы "Tarifs" и "Operations" по внешнеим ключам "TarifId" и "OperationId" из "Norms" соответственно
-- 3) К ней подключаем таблицу "Operations" по внешнему ключу "OperationId" из "Norms"
-- 4) К ней подключаем таблицу "Materials" по внешнему ключу "MaterialId" из "Operations"
-- 6) Группируем данные для каждой детали
-- 5) В SELECT расчитываем округлённые до 1 знака суммы FinalWorkPrice (стоимость подготовительно-заключительных работ) (не забывая учесть перевод из минут в часы)
-- и MaterialPrice (стоимость на штуку)

SELECT p."Id",
ROUND(SUM(n."FinalMinuteTime" / 60.0 * t."PerHour"), 1) as "FinalWorkPrice",
ROUND(SUM(m."PlanPrice" * o."NeededAmount"::numeric), 1) as "MaterialPrice"
FROM "Parts" AS p
INNER JOIN "Norms" AS n ON n."PartId" = p."Id"
INNER JOIN "Tarifs" AS t ON n."TarifId" = t."Id"
INNER JOIN "Operations" AS o ON n."OperationId" = o."Id"
INNER JOIN "Materials" AS m ON o."MaterialId" = m."Id"
GROUP BY p."Id";
