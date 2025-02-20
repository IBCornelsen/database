/*
  Warnings:

  - A unique constraint covering the columns `[geg_einpreisung_id]` on the table `GEGNachweisWohnen` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "Anteilshaber" ALTER COLUMN "uid" SET DEFAULT 'ant-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Aufnahme" ALTER COLUMN "uid" SET DEFAULT 'auf-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "BedarfsausweisWohnen" ALTER COLUMN "uid" SET DEFAULT 'baw-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Bild" ALTER COLUMN "uid" SET DEFAULT 'img-' || gen_random_uuid(),
ALTER COLUMN "aufnahme_id" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Event" ALTER COLUMN "uid" SET DEFAULT 'evt-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "GEGNachweisWohnen" ADD COLUMN     "geg_einpreisung_id" INTEGER,
ALTER COLUMN "uid" SET DEFAULT 'gnw-' || gen_random_uuid();

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

-- CreateTable
CREATE TABLE "BedarfsausweisGewerbe" (
    "id" SERIAL NOT NULL,
    "uid" TEXT NOT NULL DEFAULT 'bag-' || gen_random_uuid(),
    "benutzer_id" INTEGER,
    "aufnahme_id" INTEGER NOT NULL,
    "geg_einpreisung_id" INTEGER,

    CONSTRAINT "BedarfsausweisGewerbe_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GEGEinpreisung" (
    "id" SERIAL NOT NULL,
    "uid" TEXT NOT NULL DEFAULT 'gge-' || gen_random_uuid(),
    "benutzer_id" INTEGER,

    CONSTRAINT "GEGEinpreisung_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GEGNachweisGewerbe" (
    "id" SERIAL NOT NULL,
    "uid" TEXT NOT NULL DEFAULT 'gng-' || gen_random_uuid(),
    "benutzer_id" INTEGER,
    "aufnahme_id" INTEGER NOT NULL,
    "geg_einpreisung_id" INTEGER,

    CONSTRAINT "GEGNachweisGewerbe_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "BedarfsausweisGewerbe_uid_key" ON "BedarfsausweisGewerbe"("uid");

-- CreateIndex
CREATE UNIQUE INDEX "BedarfsausweisGewerbe_aufnahme_id_key" ON "BedarfsausweisGewerbe"("aufnahme_id");

-- CreateIndex
CREATE UNIQUE INDEX "BedarfsausweisGewerbe_geg_einpreisung_id_key" ON "BedarfsausweisGewerbe"("geg_einpreisung_id");

-- CreateIndex
CREATE UNIQUE INDEX "GEGEinpreisung_uid_key" ON "GEGEinpreisung"("uid");

-- CreateIndex
CREATE UNIQUE INDEX "GEGNachweisGewerbe_uid_key" ON "GEGNachweisGewerbe"("uid");

-- CreateIndex
CREATE UNIQUE INDEX "GEGNachweisGewerbe_aufnahme_id_key" ON "GEGNachweisGewerbe"("aufnahme_id");

-- CreateIndex
CREATE UNIQUE INDEX "GEGNachweisGewerbe_geg_einpreisung_id_key" ON "GEGNachweisGewerbe"("geg_einpreisung_id");

-- CreateIndex
CREATE UNIQUE INDEX "GEGNachweisWohnen_geg_einpreisung_id_key" ON "GEGNachweisWohnen"("geg_einpreisung_id");

-- AddForeignKey
ALTER TABLE "BedarfsausweisGewerbe" ADD CONSTRAINT "BedarfsausweisGewerbe_benutzer_id_fkey" FOREIGN KEY ("benutzer_id") REFERENCES "benutzer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "BedarfsausweisGewerbe" ADD CONSTRAINT "BedarfsausweisGewerbe_aufnahme_id_fkey" FOREIGN KEY ("aufnahme_id") REFERENCES "Aufnahme"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "BedarfsausweisGewerbe" ADD CONSTRAINT "BedarfsausweisGewerbe_geg_einpreisung_id_fkey" FOREIGN KEY ("geg_einpreisung_id") REFERENCES "GEGEinpreisung"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "GEGEinpreisung" ADD CONSTRAINT "GEGEinpreisung_benutzer_id_fkey" FOREIGN KEY ("benutzer_id") REFERENCES "benutzer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "GEGNachweisGewerbe" ADD CONSTRAINT "GEGNachweisGewerbe_benutzer_id_fkey" FOREIGN KEY ("benutzer_id") REFERENCES "benutzer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "GEGNachweisGewerbe" ADD CONSTRAINT "GEGNachweisGewerbe_aufnahme_id_fkey" FOREIGN KEY ("aufnahme_id") REFERENCES "Aufnahme"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "GEGNachweisGewerbe" ADD CONSTRAINT "GEGNachweisGewerbe_geg_einpreisung_id_fkey" FOREIGN KEY ("geg_einpreisung_id") REFERENCES "GEGEinpreisung"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "GEGNachweisWohnen" ADD CONSTRAINT "GEGNachweisWohnen_geg_einpreisung_id_fkey" FOREIGN KEY ("geg_einpreisung_id") REFERENCES "GEGEinpreisung"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
