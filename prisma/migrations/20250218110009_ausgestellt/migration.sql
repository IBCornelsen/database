/*
  Warnings:

  - You are about to drop the column `bestellt` on the `Aufnahme` table. All the data in the column will be lost.
  - You are about to drop the column `erledigt` on the `Aufnahme` table. All the data in the column will be lost.
  - You are about to drop the column `prueftext` on the `Aufnahme` table. All the data in the column will be lost.
  - You are about to drop the column `storniert` on the `Aufnahme` table. All the data in the column will be lost.
  - You are about to drop the column `zurueckgestellt` on the `Aufnahme` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Anteilshaber" ALTER COLUMN "uid" SET DEFAULT 'ant-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Aufnahme" DROP COLUMN "bestellt",
DROP COLUMN "erledigt",
DROP COLUMN "prueftext",
DROP COLUMN "storniert",
DROP COLUMN "zurueckgestellt",
ALTER COLUMN "uid" SET DEFAULT 'auf-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "BedarfsausweisWohnen" ADD COLUMN     "ausgestellt" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "bestellt" BOOLEAN DEFAULT false,
ADD COLUMN     "prueftext" VARCHAR(1000),
ADD COLUMN     "storniert" BOOLEAN DEFAULT false,
ADD COLUMN     "zurueckgestellt" BOOLEAN DEFAULT false,
ALTER COLUMN "uid" SET DEFAULT 'baw-' || gen_random_uuid();

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
ALTER TABLE "VerbrauchsausweisGewerbe" ADD COLUMN     "ausgestellt" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "bestellt" BOOLEAN DEFAULT false,
ADD COLUMN     "prueftext" VARCHAR(1000),
ADD COLUMN     "storniert" BOOLEAN DEFAULT false,
ADD COLUMN     "zurueckgestellt" BOOLEAN DEFAULT false,
ALTER COLUMN "uid" SET DEFAULT 'vag-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "VerbrauchsausweisWohnen" ADD COLUMN     "ausgestellt" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "bestellt" BOOLEAN DEFAULT false,
ADD COLUMN     "prueftext" VARCHAR(1000),
ADD COLUMN     "storniert" BOOLEAN DEFAULT false,
ADD COLUMN     "zurueckgestellt" BOOLEAN DEFAULT false,
ALTER COLUMN "uid" SET DEFAULT 'vaw-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "benutzer" ALTER COLUMN "uid" SET DEFAULT 'usr-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "gebaeude_bilder" ALTER COLUMN "uid" SET DEFAULT 'img-' || gen_random_uuid();
