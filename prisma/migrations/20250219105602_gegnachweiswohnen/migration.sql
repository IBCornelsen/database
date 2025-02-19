/*
  Warnings:

  - You are about to drop the column `geg_anfrage` on the `BedarfsausweisWohnen` table. All the data in the column will be lost.
  - You are about to drop the column `objekt_id` on the `Bild` table. All the data in the column will be lost.
  - You are about to drop the column `objekt_id` on the `Unterlage` table. All the data in the column will be lost.
  - You are about to drop the column `geg_anfrage` on the `VerbrauchsausweisGewerbe` table. All the data in the column will be lost.
  - You are about to drop the column `wird_gekuehlt` on the `VerbrauchsausweisGewerbe` table. All the data in the column will be lost.
  - You are about to drop the column `geg_anfrage` on the `VerbrauchsausweisWohnen` table. All the data in the column will be lost.
  - You are about to drop the column `wird_gekuehlt` on the `VerbrauchsausweisWohnen` table. All the data in the column will be lost.
  - Added the required column `aufnahme_id` to the `Bild` table without a default value. This is not possible if the table is not empty.
  - Added the required column `aufnahme_id` to the `Unterlage` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Bild" DROP CONSTRAINT "Bild_objekt_id_fkey";

-- DropForeignKey
ALTER TABLE "Unterlage" DROP CONSTRAINT "Unterlage_objekt_id_fkey";

-- AlterTable
ALTER TABLE "Anteilshaber" ALTER COLUMN "uid" SET DEFAULT 'ant-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Aufnahme" ALTER COLUMN "uid" SET DEFAULT 'auf-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "BedarfsausweisWohnen" DROP COLUMN "geg_anfrage",
ALTER COLUMN "uid" SET DEFAULT 'baw-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Bild" DROP COLUMN "objekt_id",
ADD COLUMN     "aufnahme_id" INTEGER NOT NULL,
ALTER COLUMN "uid" SET DEFAULT 'img-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Event" ALTER COLUMN "uid" SET DEFAULT 'evt-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Objekt" ALTER COLUMN "uid" SET DEFAULT 'obj-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Rechnung" ALTER COLUMN "uid" SET DEFAULT 'inv-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Tickets" ALTER COLUMN "uid" SET DEFAULT 'tkt-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Unterlage" DROP COLUMN "objekt_id",
ADD COLUMN     "aufnahme_id" INTEGER NOT NULL,
ALTER COLUMN "uid" SET DEFAULT 'pln-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "VerbrauchsausweisGewerbe" DROP COLUMN "geg_anfrage",
DROP COLUMN "wird_gekuehlt",
ALTER COLUMN "uid" SET DEFAULT 'vag-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "VerbrauchsausweisWohnen" DROP COLUMN "geg_anfrage",
DROP COLUMN "wird_gekuehlt",
ALTER COLUMN "uid" SET DEFAULT 'vaw-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "benutzer" ALTER COLUMN "uid" SET DEFAULT 'usr-' || gen_random_uuid();

-- CreateTable
CREATE TABLE "GEGNachweisWohnen" (
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

    CONSTRAINT "GEGNachweisWohnen_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "GEGNachweisWohnen_uid_key" ON "GEGNachweisWohnen"("uid");

-- CreateIndex
CREATE UNIQUE INDEX "GEGNachweisWohnen_aufnahme_id_key" ON "GEGNachweisWohnen"("aufnahme_id");

-- AddForeignKey
ALTER TABLE "GEGNachweisWohnen" ADD CONSTRAINT "GEGNachweisWohnen_aufnahme_id_fkey" FOREIGN KEY ("aufnahme_id") REFERENCES "Aufnahme"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Bild" ADD CONSTRAINT "Bild_aufnahme_id_fkey" FOREIGN KEY ("aufnahme_id") REFERENCES "Aufnahme"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Unterlage" ADD CONSTRAINT "Unterlage_aufnahme_id_fkey" FOREIGN KEY ("aufnahme_id") REFERENCES "Aufnahme"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
