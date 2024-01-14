/*
  Warnings:

  - Changed the type of `kategorie` on the `gebaeude_bilder` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- CreateEnum
CREATE TYPE "BilderKategorie" AS ENUM ('Heizung', 'Fenster', 'Gebaeude', 'Daemmung');

-- AlterTable
ALTER TABLE "gebaeude_bilder" DROP COLUMN "kategorie",
ADD COLUMN     "kategorie" "BilderKategorie" NOT NULL;

-- DropEnum
DROP TYPE "Kategorie";
