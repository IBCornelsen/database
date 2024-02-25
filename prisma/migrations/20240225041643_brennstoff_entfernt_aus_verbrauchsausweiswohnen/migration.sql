/*
  Warnings:

  - You are about to drop the column `brennstoff_1` on the `VerbrauchsausweisWohnen` table. All the data in the column will be lost.
  - You are about to drop the column `brennstoff_2` on the `VerbrauchsausweisWohnen` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "VerbrauchsausweisWohnen" DROP COLUMN "brennstoff_1",
DROP COLUMN "brennstoff_2";
