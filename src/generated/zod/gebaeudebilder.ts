import * as z from "zod"
import { BilderKategorie } from "@prisma/client"

export const GebaeudeBilderSchema = z.object({
  id: z.number().int(),
  kategorie: z.nativeEnum(BilderKategorie),
  uid: z.string(),
  objekt_id: z.number().int(),
})
