/*
  Warnings:

  - Added the required column `bezahlmethode` to the `GEGEinpreisung` table without a default value. This is not possible if the table is not empty.
  - Added the required column `status` to the `GEGEinpreisung` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "Einpreisungsstatus" AS ENUM ('open', 'canceled', 'pending', 'expired');

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
ALTER TABLE "GEGEinpreisung" ADD COLUMN     "abweichende_versand_adresse" BOOLEAN DEFAULT false,
ADD COLUMN     "bezahlmethode" "Bezahlmethoden" NOT NULL,
ADD COLUMN     "email" VARCHAR,
ADD COLUMN     "empfaenger" VARCHAR,
ADD COLUMN     "ort" VARCHAR,
ADD COLUMN     "plz" VARCHAR,
ADD COLUMN     "status" "Einpreisungsstatus" NOT NULL,
ADD COLUMN     "strasse" VARCHAR,
ADD COLUMN     "telefon" VARCHAR,
ADD COLUMN     "versand_empfaenger" VARCHAR,
ADD COLUMN     "versand_ort" VARCHAR,
ADD COLUMN     "versand_plz" VARCHAR,
ADD COLUMN     "versand_strasse" VARCHAR,
ADD COLUMN     "versand_zusatzzeile" VARCHAR,
ADD COLUMN     "zusatzzeile" VARCHAR,
ALTER COLUMN "uid" SET DEFAULT 'gge-' || gen_random_uuid();

-- AlterTable
ALTER TABLE "GEGNachweisGewerbe" ALTER COLUMN "uid" SET DEFAULT 'gng-' || gen_random_uuid();

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
