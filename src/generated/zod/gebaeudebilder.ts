import * as z from "zod"
import * as imports from "../../../prisma/null"
import { BilderKategorie } from "@prisma/client"

export const GebaeudeBilderSchema = z.object({
  id: z.number().int(),
  gebaeude_stammdaten_id: z.number().int(),
  kategorie: z.nativeEnum(BilderKategorie),
  uid: z.string(),
})
