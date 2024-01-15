-- CreateEnum
CREATE TYPE "TicketStatus" AS ENUM ('OFFEN', 'IN_BEARBEITUNG', 'IN_WARTESCHLEIFE', 'GESCHLOSSEN', 'GELOEST');

-- CreateTable
CREATE TABLE "Tickets" (
    "id" SERIAL NOT NULL,
    "uid" UUID NOT NULL,
    "benutzer_id" INTEGER,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "deleted_at" TIMESTAMP(3),
    "status" "TicketStatus" NOT NULL DEFAULT 'OFFEN',
    "titel" TEXT NOT NULL,
    "beschreibung" TEXT NOT NULL,
    "bearbeiter_id" INTEGER,
    "prioritaet" INTEGER DEFAULT 0,

    CONSTRAINT "Tickets_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Tickets" ADD CONSTRAINT "Tickets_benutzer_id_fkey" FOREIGN KEY ("benutzer_id") REFERENCES "benutzer"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tickets" ADD CONSTRAINT "Tickets_bearbeiter_id_fkey" FOREIGN KEY ("bearbeiter_id") REFERENCES "benutzer"("id") ON DELETE SET NULL ON UPDATE CASCADE;
