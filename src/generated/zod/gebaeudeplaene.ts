import * as z from "zod"

export const GebaeudePlaeneSchema = z.object({
  id: z.number().int(),
  uid: z.string(),
  objekt_id: z.number().int(),
})
