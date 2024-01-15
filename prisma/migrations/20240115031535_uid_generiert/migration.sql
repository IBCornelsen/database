/*
  Warnings:

  - A unique constraint covering the columns `[uid]` on the table `Tickets` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "Tickets" ALTER COLUMN "uid" SET DEFAULT gen_random_uuid();

-- CreateIndex
CREATE UNIQUE INDEX "Tickets_uid_key" ON "Tickets"("uid");
