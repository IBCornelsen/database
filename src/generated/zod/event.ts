import * as z from "zod"

export const EventSchema = z.object({
  id: z.number().int(),
  uid: z.string(),
  date: z.date(),
  title: z.string(),
  description: z.string().nullish(),
  aufnahme_id: z.number().int(),
  benutzer_id: z.number().int().nullish(),
})
