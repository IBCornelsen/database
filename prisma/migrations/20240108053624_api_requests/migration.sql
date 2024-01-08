/*
  Warnings:

  - A unique constraint covering the columns `[plz]` on the table `Postleitzahlen` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "VerbrauchsausweisWohnen" ADD COLUMN     "ausweisart" VARCHAR NOT NULL DEFAULT 'VA',
ALTER COLUMN "benutzer_id" DROP NOT NULL;

-- CreateTable
CREATE TABLE "ApiRequests" (
    "id" SERIAL NOT NULL,
    "date" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "ip" VARCHAR(50) NOT NULL,
    "method" VARCHAR(10) NOT NULL,
    "path" VARCHAR(100) NOT NULL,
    "status" INTEGER NOT NULL,
    "responseTime" DOUBLE PRECISION NOT NULL,
    "responseSize" INTEGER NOT NULL,
    "userAgent" VARCHAR(500) NOT NULL,
    "user_id" INTEGER,

    CONSTRAINT "ApiRequests_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Postleitzahlen_plz_key" ON "Postleitzahlen"("plz");

-- AddForeignKey
ALTER TABLE "ApiRequests" ADD CONSTRAINT "ApiRequests_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "benutzer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
