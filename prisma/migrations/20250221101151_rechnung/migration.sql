/*
  Warnings:

  - You are about to drop the column `aufnahme_id` on the `Rechnung` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[rechnung_id]` on the table `BedarfsausweisGewerbe` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[rechnung_id]` on the table `BedarfsausweisWohnen` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[rechnung_id]` on the table `GEGNachweisGewerbe` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[rechnung_id]` on the table `GEGNachweisWohnen` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[rechnung_id]` on the table `VerbrauchsausweisGewerbe` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[rechnung_id]` on the table `VerbrauchsausweisWohnen` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "Rechnung" DROP CONSTRAINT "Rechnung_aufnahme_id_fkey";

-- AlterTable
ALTER TABLE "Anteilshaber" ALTER COLUMN "uid" SET DEFAULT 'ant-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Aufnahme" ALTER COLUMN "uid" SET DEFAULT 'auf-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "BedarfsausweisGewerbe" ADD COLUMN     "rechnung_id" INTEGER,
ALTER COLUMN "uid" SET DEFAULT 'bag-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "BedarfsausweisWohnen" ADD COLUMN     "rechnung_id" INTEGER,
ALTER COLUMN "uid" SET DEFAULT 'baw-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Bild" ALTER COLUMN "uid" SET DEFAULT 'img-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Event" ALTER COLUMN "uid" SET DEFAULT 'evt-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "GEGEinpreisung" ALTER COLUMN "uid" SET DEFAULT 'gge-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "GEGNachweisGewerbe" ADD COLUMN     "rechnung_id" INTEGER,
ALTER COLUMN "uid" SET DEFAULT 'gnw-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "GEGNachweisWohnen" ADD COLUMN     "rechnung_id" INTEGER,
ALTER COLUMN "uid" SET DEFAULT 'gnw-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Objekt" ALTER COLUMN "uid" SET DEFAULT 'obj-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Rechnung" DROP COLUMN "aufnahme_id",
ALTER COLUMN "uid" SET DEFAULT 'inv-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Tickets" ALTER COLUMN "uid" SET DEFAULT 'tkt-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Unterlage" ALTER COLUMN "uid" SET DEFAULT 'pln-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "VerbrauchsausweisGewerbe" ADD COLUMN     "rechnung_id" INTEGER,
ALTER COLUMN "uid" SET DEFAULT 'vag-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "VerbrauchsausweisWohnen" ADD COLUMN     "rechnung_id" INTEGER,
ALTER COLUMN "uid" SET DEFAULT 'vaw-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "benutzer" ALTER COLUMN "uid" SET DEFAULT 'usr-' || gen_random_uuid();

-- CreateIndex
CREATE UNIQUE INDEX "BedarfsausweisGewerbe_rechnung_id_key" ON "BedarfsausweisGewerbe"("rechnung_id");

-- CreateIndex
CREATE UNIQUE INDEX "BedarfsausweisWohnen_rechnung_id_key" ON "BedarfsausweisWohnen"("rechnung_id");

-- CreateIndex
CREATE UNIQUE INDEX "GEGNachweisGewerbe_rechnung_id_key" ON "GEGNachweisGewerbe"("rechnung_id");

-- CreateIndex
CREATE UNIQUE INDEX "GEGNachweisWohnen_rechnung_id_key" ON "GEGNachweisWohnen"("rechnung_id");

-- CreateIndex
CREATE UNIQUE INDEX "VerbrauchsausweisGewerbe_rechnung_id_key" ON "VerbrauchsausweisGewerbe"("rechnung_id");

-- CreateIndex
CREATE UNIQUE INDEX "VerbrauchsausweisWohnen_rechnung_id_key" ON "VerbrauchsausweisWohnen"("rechnung_id");

-- AddForeignKey
ALTER TABLE "BedarfsausweisGewerbe" ADD CONSTRAINT "BedarfsausweisGewerbe_rechnung_id_fkey" FOREIGN KEY ("rechnung_id") REFERENCES "Rechnung"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "BedarfsausweisWohnen" ADD CONSTRAINT "BedarfsausweisWohnen_rechnung_id_fkey" FOREIGN KEY ("rechnung_id") REFERENCES "Rechnung"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "GEGNachweisGewerbe" ADD CONSTRAINT "GEGNachweisGewerbe_rechnung_id_fkey" FOREIGN KEY ("rechnung_id") REFERENCES "Rechnung"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "GEGNachweisWohnen" ADD CONSTRAINT "GEGNachweisWohnen_rechnung_id_fkey" FOREIGN KEY ("rechnung_id") REFERENCES "Rechnung"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "VerbrauchsausweisGewerbe" ADD CONSTRAINT "VerbrauchsausweisGewerbe_rechnung_id_fkey" FOREIGN KEY ("rechnung_id") REFERENCES "Rechnung"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "VerbrauchsausweisWohnen" ADD CONSTRAINT "VerbrauchsausweisWohnen_rechnung_id_fkey" FOREIGN KEY ("rechnung_id") REFERENCES "Rechnung"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
