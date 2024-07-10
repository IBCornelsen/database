import * as z from "zod"
import * as imports from "../../../prisma/null"

export const PostleitzahlenSchema = z.object({
  id: z.number().int(),
  plz: z.string(),
  stadt: z.string(),
  bundesland: z.string(),
  landkreis: z.string(),
  lat: z.number(),
  lon: z.number(),
})
