import * as z from "zod"

export const PostleitzahlenSchema = z.object({
  id: z.number().int(),
  plz: z.string(),
  stadt: z.string(),
  bundesland: z.string(),
  landkreis: z.string(),
  lat: z.number(),
  lon: z.number(),
})
