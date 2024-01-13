/*
  Warnings:

  - Added the required column `landkreis` to the `Postleitzahlen` table without a default value. This is not possible if the table is not empty.
  - Added the required column `lat` to the `Postleitzahlen` table without a default value. This is not possible if the table is not empty.
  - Added the required column `lon` to the `Postleitzahlen` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Postleitzahlen" ADD COLUMN     "landkreis" VARCHAR(100) NOT NULL,
ADD COLUMN     "lat" DOUBLE PRECISION NOT NULL,
ADD COLUMN     "lon" DOUBLE PRECISION NOT NULL;
