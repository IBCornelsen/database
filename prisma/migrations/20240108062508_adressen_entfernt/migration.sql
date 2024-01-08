/*
  Warnings:

  - You are about to drop the column `benutzer_adresse_id` on the `benutzer` table. All the data in the column will be lost.
  - You are about to drop the column `rechnung_adresse_id` on the `benutzer` table. All the data in the column will be lost.
  - You are about to drop the column `versand_adresse_id` on the `benutzer` table. All the data in the column will be lost.
  - You are about to drop the column `gebaeude_adresse_id` on the `gebaeude_stammdaten` table. All the data in the column will be lost.
  - You are about to drop the `adressen` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "adressen" DROP CONSTRAINT "adressen_benutzer_id_fkey";

-- DropForeignKey
ALTER TABLE "benutzer" DROP CONSTRAINT "benutzer_rechnung_adresse_id_fkey";

-- DropForeignKey
ALTER TABLE "benutzer" DROP CONSTRAINT "besteller_adressen_id_fkey1";

-- DropForeignKey
ALTER TABLE "benutzer" DROP CONSTRAINT "besteller_adressen_id_fkey2";

-- DropForeignKey
ALTER TABLE "gebaeude_stammdaten" DROP CONSTRAINT "gebaeude_stammdaten_gebaeude_adresse_id_fkey";

-- AlterTable
ALTER TABLE "benutzer" DROP COLUMN "benutzer_adresse_id",
DROP COLUMN "rechnung_adresse_id",
DROP COLUMN "versand_adresse_id",
ADD COLUMN     "adresse" VARCHAR(100),
ADD COLUMN     "ort" VARCHAR(50),
ADD COLUMN     "plz" VARCHAR(5);

-- AlterTable
ALTER TABLE "gebaeude_stammdaten" DROP COLUMN "gebaeude_adresse_id";

-- DropTable
DROP TABLE "adressen";
