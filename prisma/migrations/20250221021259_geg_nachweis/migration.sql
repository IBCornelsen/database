/*
  Warnings:

  - You are about to drop the column `ausgestellt` on the `GEGNachweisWohnen` table. All the data in the column will be lost.
  - You are about to drop the column `prueftext` on the `GEGNachweisWohnen` table. All the data in the column will be lost.
  - You are about to drop the column `registriernummer` on the `GEGNachweisWohnen` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Anteilshaber" ALTER COLUMN "uid" SET DEFAULT 'ant-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Aufnahme" ALTER COLUMN "uid" SET DEFAULT 'auf-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "BedarfsausweisGewerbe" ALTER COLUMN "uid" SET DEFAULT 'bag-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "BedarfsausweisWohnen" ALTER COLUMN "uid" SET DEFAULT 'baw-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Bild" ALTER COLUMN "uid" SET DEFAULT 'img-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "Event" ALTER COLUMN "uid" SET DEFAULT 'evt-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "GEGEinpreisung" ALTER COLUMN "uid" SET DEFAULT 'gge-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "GEGNachweisGewerbe" ADD COLUMN     "ausstellgrund" "Ausstellgrund",
ADD COLUMN     "beschreibung" TEXT,
ADD COLUMN     "bestellt" BOOLEAN DEFAULT false,
ADD COLUMN     "keller_beheizt" BOOLEAN,
ADD COLUMN     "storniert" BOOLEAN DEFAULT false,
ADD COLUMN     "zurueckgestellt" BOOLEAN DEFAULT false,
ALTER COLUMN "uid" SET DEFAULT 'gnw-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "GEGNachweisWohnen" DROP COLUMN "ausgestellt",
DROP COLUMN "prueftext",
DROP COLUMN "registriernummer",
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
