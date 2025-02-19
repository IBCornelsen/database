/*
  Warnings:

  - You are about to drop the `gebaeude_bilder` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "gebaeude_bilder" DROP CONSTRAINT "gebaeude_bilder_objekt_id_fkey";

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
ALTER TABLE "Unterlage" ALTER COLUMN "uid" SET DEFAULT 'pln-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "VerbrauchsausweisGewerbe" ALTER COLUMN "uid" SET DEFAULT 'vag-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "VerbrauchsausweisWohnen" ALTER COLUMN "uid" SET DEFAULT 'vaw-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "benutzer" ALTER COLUMN "uid" SET DEFAULT 'usr-' || gen_random_uuid();

-- DropTable
DROP TABLE "gebaeude_bilder";

-- CreateTable
CREATE TABLE "Bild" (
    "id" SERIAL NOT NULL,
    "kategorie" "BilderKategorie" NOT NULL,
    "uid" TEXT NOT NULL DEFAULT 'img-' || gen_random_uuid(),
    "objekt_id" INTEGER NOT NULL,

    CONSTRAINT "Bild_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Bild_uid_key" ON "Bild"("uid");

-- AddForeignKey
ALTER TABLE "Bild" ADD CONSTRAINT "Bild_objekt_id_fkey" FOREIGN KEY ("objekt_id") REFERENCES "Objekt"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
