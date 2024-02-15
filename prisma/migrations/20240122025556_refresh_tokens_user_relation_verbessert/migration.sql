/*
  Warnings:

  - You are about to drop the column `uid` on the `RefreshTokens` table. All the data in the column will be lost.
  - Added the required column `benutzer_id` to the `RefreshTokens` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "RefreshTokens" DROP CONSTRAINT "RefreshTokens_uid_fkey";

-- AlterTable
ALTER TABLE "RefreshTokens" DROP COLUMN "uid",
ADD COLUMN     "benutzer_id" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "RefreshTokens" ADD CONSTRAINT "RefreshTokens_benutzer_id_fkey" FOREIGN KEY ("benutzer_id") REFERENCES "benutzer"("id") ON DELETE CASCADE ON UPDATE CASCADE;
