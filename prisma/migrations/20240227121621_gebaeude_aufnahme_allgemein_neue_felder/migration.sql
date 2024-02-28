-- AlterTable
ALTER TABLE "GebaeudeAufnahmeAllgemein" ADD COLUMN     "bestellt" BOOLEAN DEFAULT false,
ADD COLUMN     "energieeffizienzklasse" VARCHAR(5),
ADD COLUMN     "primaerfaktor_1" DOUBLE PRECISION,
ADD COLUMN     "primaerfaktor_2" DOUBLE PRECISION,
ADD COLUMN     "primaerfaktor_warmwasser_1" DOUBLE PRECISION,
ADD COLUMN     "primaerfaktor_warmwasser_2" DOUBLE PRECISION,
ADD COLUMN     "prueftext" VARCHAR(1000),
ADD COLUMN     "zurueckgestellt" BOOLEAN DEFAULT false;
