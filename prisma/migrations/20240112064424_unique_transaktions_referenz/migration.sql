/*
  Warnings:

  - A unique constraint covering the columns `[transaktions_referenz]` on the table `rechnungen` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "rechnungen_transaktions_referenz_key" ON "rechnungen"("transaktions_referenz");
