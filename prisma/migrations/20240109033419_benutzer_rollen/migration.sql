/*
  Warnings:

  - You are about to drop the column `enddatum` on the `VerbrauchsausweisWohnen` table. All the data in the column will be lost.
  - You are about to drop the `TokenUsage` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "UserRolle" AS ENUM ('user', 'admin');

-- DropForeignKey
ALTER TABLE "TokenUsage" DROP CONSTRAINT "fk_tokens_token_usage_token_id";

-- AlterTable
ALTER TABLE "VerbrauchsausweisWohnen" DROP COLUMN "enddatum";

-- AlterTable
ALTER TABLE "benutzer" ADD COLUMN     "anrede" VARCHAR(50),
ADD COLUMN     "rolle" "UserRolle" NOT NULL DEFAULT 'user',
ADD COLUMN     "telefon" VARCHAR(50);

-- DropTable
DROP TABLE "TokenUsage";
