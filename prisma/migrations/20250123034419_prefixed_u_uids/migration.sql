-- AlterTable
ALTER TABLE "Anteilshaber" ALTER COLUMN "uid" SET DEFAULT 'ant-' || gen_random_uuid(),
ALTER COLUMN "uid" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "Aufnahme" ALTER COLUMN "uid" SET DEFAULT 'auf-' || gen_random_uuid(),
ALTER COLUMN "uid" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "BedarfsausweisWohnen" ALTER COLUMN "uid" SET DEFAULT 'baw-' || gen_random_uuid(),
ALTER COLUMN "uid" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "Event" ALTER COLUMN "uid" SET DEFAULT 'evt-' || gen_random_uuid(),
ALTER COLUMN "uid" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "GebaeudePlaene" ALTER COLUMN "uid" SET DEFAULT 'pln-' || gen_random_uuid(),
ALTER COLUMN "uid" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "Objekt" ALTER COLUMN "uid" SET DEFAULT 'obj-' || gen_random_uuid(),
ALTER COLUMN "uid" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "Rechnung" ALTER COLUMN "uid" SET DEFAULT 'inv-' || gen_random_uuid(),
ALTER COLUMN "uid" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "Tickets" ALTER COLUMN "uid" SET DEFAULT 'tkt-' || gen_random_uuid(),
ALTER COLUMN "uid" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "VerbrauchsausweisGewerbe" ALTER COLUMN "uid" SET DEFAULT 'vag-' || gen_random_uuid(),
ALTER COLUMN "uid" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "VerbrauchsausweisWohnen" ALTER COLUMN "uid" SET DEFAULT 'vaw-' || gen_random_uuid(),
ALTER COLUMN "uid" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "benutzer" ALTER COLUMN "uid" SET DEFAULT 'usr-' || gen_random_uuid(),
ALTER COLUMN "uid" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "gebaeude_bilder" ALTER COLUMN "uid" SET DEFAULT 'img-' || gen_random_uuid(),
ALTER COLUMN "uid" SET DATA TYPE TEXT;
