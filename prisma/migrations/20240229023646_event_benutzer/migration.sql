/*
  Warnings:

  - You are about to drop the column `user_id` on the `Event` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Event" DROP CONSTRAINT "Event_user_id_fkey";

-- AlterTable
ALTER TABLE "Event" DROP COLUMN "user_id",
ADD COLUMN     "benutzer_id" INTEGER;

-- AddForeignKey
ALTER TABLE "Event" ADD CONSTRAINT "Event_benutzer_id_fkey" FOREIGN KEY ("benutzer_id") REFERENCES "benutzer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
