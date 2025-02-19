/*
  Warnings:

  - You are about to drop the `GEGNachweisWohnen` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "GEGNachweisWohnen" DROP CONSTRAINT "GEGNachweisWohnen_aufnahme_id_fkey";

-- AlterTable
ALTER TABLE "Anteilshaber" ALTER COLUMN "uid" SET DEFAULT 'ant-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Aufnahme" ALTER COLUMN "uid" SET DEFAULT 'auf-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "BedarfsausweisWohnen" ALTER COLUMN "uid" SET DEFAULT 'baw-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Bild" ALTER COLUMN "uid" SET DEFAULT 'img-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Event" ALTER COLUMN "uid" SET DEFAULT 'evt-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Objekt" ALTER COLUMN "uid" SET DEFAULT 'obj-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Rechnung" ALTER COLUMN "uid" SET DEFAULT 'inv-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Tickets" ALTER COLUMN "uid" SET DEFAULT 'tkt-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Unterlage" ALTER COLUMN "uid" SET DEFAULT 'pln-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "VerbrauchsausweisGewerbe" ALTER COLUMN "uid" SET DEFAULT 'vag-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "VerbrauchsausweisWohnen" ALTER COLUMN "uid" SET DEFAULT 'vaw-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "benutzer" ALTER COLUMN "uid" SET DEFAULT 'usr-' || gen_random_uuid();

-- DropTable
DROP TABLE "GEGNachweisWohnen";

-- CreateTable
CREATE TABLE "gegNachweisWohnen" (
    "id" SERIAL NOT NULL,
    "uid" TEXT NOT NULL DEFAULT 'gnw-' || gen_random_uuid(),
    "benutzer_id" INTEGER,
    "ausstellgrund" "Ausstellgrund",
    "registriernummer" VARCHAR,
    "keller_beheizt" BOOLEAN,
    "ausgestellt" BOOLEAN DEFAULT false,
    "storniert" BOOLEAN DEFAULT false,
    "bestellt" BOOLEAN DEFAULT false,
    "zurueckgestellt" BOOLEAN DEFAULT false,
    "prueftext" VARCHAR(1000),
    "beschreibung" TEXT,
    "aufnahme_id" INTEGER NOT NULL,

    CONSTRAINT "gegNachweisWohnen_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "gegNachweisWohnen_uid_key" ON "gegNachweisWohnen"("uid");

-- CreateIndex
CREATE UNIQUE INDEX "gegNachweisWohnen_aufnahme_id_key" ON "gegNachweisWohnen"("aufnahme_id");

-- AddForeignKey
ALTER TABLE "gegNachweisWohnen" ADD CONSTRAINT "gegNachweisWohnen_aufnahme_id_fkey" FOREIGN KEY ("aufnahme_id") REFERENCES "Aufnahme"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
