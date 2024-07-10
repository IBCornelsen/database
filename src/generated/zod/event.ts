import * as z from "zod"
import * as imports from "../../../prisma/null"

export const EventSchema = z.object({
  id: z.number().int(),
  uid: z.string(),
  date: z.date(),
  title: z.string(),
  description: z.string().nullish(),
  gebaeude_aufnahme_allgemein_id: z.number().int().nullish(),
  benutzer_id: z.number().int().nullish(),
})
