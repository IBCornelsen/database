/*
  Warnings:

  - The values [GEGNachweisVerbrauchsausweisWohnen,GEGNachweisBedarfsausweisWohnen,GEGNachweisVerbrauchsausweisGewerbe] on the enum `Ausweisart` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "Ausweisart_new" AS ENUM ('VerbrauchsausweisWohnen', 'VerbrauchsausweisGewerbe', 'BedarfsausweisWohnen', 'BedarfsausweisGewerbe', 'GEGNachweisWohnen', 'GEGNachweisBedarfsausweis', 'GEGNachweisGewerbe');
ALTER TABLE "Aufnahme" ALTER COLUMN "ausweisart" TYPE "Ausweisart_new" USING ("ausweisart"::text::"Ausweisart_new");
ALTER TYPE "Ausweisart" RENAME TO "Ausweisart_old";
ALTER TYPE "Ausweisart_new" RENAME TO "Ausweisart";
DROP TYPE "Ausweisart_old";
COMMIT;

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
ALTER TABLE "GEGNachweisWohnen" ALTER COLUMN "uid" SET DEFAULT 'gnw-' || gen_random_uuid();

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
