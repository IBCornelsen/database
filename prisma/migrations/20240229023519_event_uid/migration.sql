/*
  Warnings:

  - A unique constraint covering the columns `[uid]` on the table `Event` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "Event" ADD COLUMN     "uid" UUID NOT NULL DEFAULT gen_random_uuid(),
ALTER COLUMN "description" DROP NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Event_uid_key" ON "Event"("uid");
