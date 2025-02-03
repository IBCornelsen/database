import * as z from "zod"

export const KlimafaktorenSchema = z.object({
  id: z.number().int(),
  plz: z.string(),
  month: z.number().int(),
  year: z.number().int(),
  klimafaktor: z.number(),
})
