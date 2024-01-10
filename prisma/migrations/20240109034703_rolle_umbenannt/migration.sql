/*
  Warnings:

  - The `rolle` column on the `benutzer` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- CreateEnum
CREATE TYPE "BenutzerRolle" AS ENUM ('USER', 'ADMIN');

-- AlterTable
ALTER TABLE "benutzer" DROP COLUMN "rolle",
ADD COLUMN     "rolle" "BenutzerRolle" NOT NULL DEFAULT 'USER';

-- DropEnum
DROP TYPE "UserRolle";
