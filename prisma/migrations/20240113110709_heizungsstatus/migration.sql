/*
  Warnings:

  - Added the required column `keller` to the `gebaeude_stammdaten` table without a default value. This is not possible if the table is not empty.
  - Added the required column `dachgeschoss` to the `gebaeude_stammdaten` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "Heizungsstatus" AS ENUM ('BEHEIZT', 'UNBEHEIZT', 'NICHT_VORHANDEN');

-- AlterTable
ALTER TABLE "gebaeude_stammdaten" DROP COLUMN "keller",
ADD COLUMN     "keller" "Heizungsstatus" NOT NULL,
DROP COLUMN "dachgeschoss",
ADD COLUMN     "dachgeschoss" "Heizungsstatus" NOT NULL;
