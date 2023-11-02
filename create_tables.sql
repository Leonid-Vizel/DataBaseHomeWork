CREATE TABLE "Materials" (
    "Id" integer GENERATED BY DEFAULT AS IDENTITY,
    "Name" character varying(1000) NOT NULL,
    "Measurement" character varying(100) NOT NULL,
    "PlanPrice" numeric NULL,
    CONSTRAINT "PK_Materials" PRIMARY KEY ("Id")
);

CREATE TABLE "Parts" (
    "Id" integer GENERATED BY DEFAULT AS IDENTITY,
    "DetailType" integer NOT NULL,
    "Name" character varying(2000) NOT NULL,
    "Measurement" character varying(500) NOT NULL,
    "PlanPrice" numeric NOT NULL,
    CONSTRAINT "PK_Parts" PRIMARY KEY ("Id")
);

CREATE TABLE "Professions" (
    "Id" integer GENERATED BY DEFAULT AS IDENTITY,
    "Name" character varying(1000) NOT NULL,
    CONSTRAINT "PK_Professions" PRIMARY KEY ("Id")
);

CREATE TABLE "Tarifs" (
    "Id" integer GENERATED BY DEFAULT AS IDENTITY,
    "PerHour" numeric NOT NULL,
    CONSTRAINT "PK_Tarifs" PRIMARY KEY ("Id")
);

CREATE TABLE "Operations" (
    "Id" integer GENERATED BY DEFAULT AS IDENTITY,
    "PartId" integer NOT NULL,
    "MaterialId" integer NOT NULL,
    "NeededAmount" bigint NOT NULL,
    CONSTRAINT "PK_Operations" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_Operations_Materials_MaterialId" FOREIGN KEY ("MaterialId") REFERENCES "Materials" ("Id") ON DELETE CASCADE,
    CONSTRAINT "FK_Operations_Parts_PartId" FOREIGN KEY ("PartId") REFERENCES "Parts" ("Id") ON DELETE CASCADE
);

CREATE TABLE "Norms" (
    "PartId" integer NOT NULL,
    "OperationId" integer NOT NULL,
    "ProfessionId" integer NOT NULL,
    "TarifId" integer NOT NULL,
    "Qualification" character varying(2000) NOT NULL,
    "FinalMinuteTime" integer NOT NULL,
    "PieceMinuteTime" integer NOT NULL,
    CONSTRAINT "PK_Norms" PRIMARY KEY ("PartId", "OperationId", "ProfessionId", "TarifId"),
    CONSTRAINT "FK_Norms_Operations_OperationId" FOREIGN KEY ("OperationId") REFERENCES "Operations" ("Id") ON DELETE CASCADE,
    CONSTRAINT "FK_Norms_Parts_PartId" FOREIGN KEY ("PartId") REFERENCES "Parts" ("Id") ON DELETE CASCADE,
    CONSTRAINT "FK_Norms_Professions_ProfessionId" FOREIGN KEY ("ProfessionId") REFERENCES "Professions" ("Id") ON DELETE CASCADE,
    CONSTRAINT "FK_Norms_Tarifs_TarifId" FOREIGN KEY ("TarifId") REFERENCES "Tarifs" ("Id") ON DELETE CASCADE
);

CREATE INDEX "IX_Norms_OperationId" ON "Norms" ("OperationId");
CREATE INDEX "IX_Norms_ProfessionId" ON "Norms" ("ProfessionId");
CREATE INDEX "IX_Norms_TarifId" ON "Norms" ("TarifId");
CREATE INDEX "IX_Norms_PartId" ON "Norms" ("PartId");
CREATE INDEX "IX_Operations_MaterialId" ON "Operations" ("MaterialId");
CREATE INDEX "IX_Operations_PartId" ON "Operations" ("PartId");


CREATE PROCEDURE Init()
LANGUAGE SQL
AS $$
INSERT INTO "Materials"("Name", "Measurement", "PlanPrice") VALUES('Тестовый материал 1','кг',11.0);
INSERT INTO "Materials"("Name", "Measurement", "PlanPrice") VALUES('Тестовый материал 2','кг',12.0);
INSERT INTO "Materials"("Name", "Measurement", "PlanPrice") VALUES('Тестовый материал 3','кг',13.0);
INSERT INTO "Materials"("Name", "Measurement", "PlanPrice") VALUES('Тестовый материал 4','кг',14.0);
INSERT INTO "Materials"("Name", "Measurement", "PlanPrice") VALUES('Тестовый материал 5','кг',15.0);
INSERT INTO "Materials"("Name", "Measurement", "PlanPrice") VALUES('Тестовый материал 6','кг',16.0);
$$;
