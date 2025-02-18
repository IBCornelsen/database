/*
  Warnings:

  - You are about to drop the `GebaeudePlaene` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "GebaeudePlaene" DROP CONSTRAINT "GebaeudePlaene_objekt_id_fkey";

-- AlterTable
ALTER TABLE "Anteilshaber" ALTER COLUMN "uid" SET DEFAULT 'ant-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Aufnahme" ALTER COLUMN "uid" SET DEFAULT 'auf-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "BedarfsausweisWohnen" ALTER COLUMN "uid" SET DEFAULT 'baw-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Event" ALTER COLUMN "uid" SET DEFAULT 'evt-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Objekt" ALTER COLUMN "uid" SET DEFAULT 'obj-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Rechnung" ALTER COLUMN "uid" SET DEFAULT 'inv-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Tickets" ALTER COLUMN "uid" SET DEFAULT 'tkt-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "VerbrauchsausweisGewerbe" ALTER COLUMN "uid" SET DEFAULT 'vag-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "VerbrauchsausweisWohnen" ALTER COLUMN "uid" SET DEFAULT 'vaw-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "benutzer" ALTER COLUMN "uid" SET DEFAULT 'usr-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "gebaeude_bilder" ALTER COLUMN "uid" SET DEFAULT 'img-' || gen_random_uuid();

-- DropTable
DROP TABLE "GebaeudePlaene";

-- CreateTable
CREATE TABLE "Plan" (
    "id" SERIAL NOT NULL,
    "uid" TEXT NOT NULL DEFAULT 'pln-' || gen_random_uuid(),
    "name" TEXT,
    "kategorie" TEXT,
    "objekt_id" INTEGER NOT NULL,

    CONSTRAINT "Plan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Unterlage" (
    "id" SERIAL NOT NULL,
    "uid" TEXT NOT NULL DEFAULT 'pln-' || gen_random_uuid(),
    "name" TEXT,
    "kategorie" TEXT,
    "objekt_id" INTEGER NOT NULL,

    CONSTRAINT "Unterlage_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Plan_uid_key" ON "Plan"("uid");

-- CreateIndex
CREATE UNIQUE INDEX "Unterlage_uid_key" ON "Unterlage"("uid");

-- AddForeignKey
ALTER TABLE "Plan" ADD CONSTRAINT "Plan_objekt_id_fkey" FOREIGN KEY ("objekt_id") REFERENCES "Objekt"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Unterlage" ADD CONSTRAINT "Unterlage_objekt_id_fkey" FOREIGN KEY ("objekt_id") REFERENCES "Objekt"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
