import * as z from "zod"

export const documenttypesSchema = z.object({
  id: z.number().int(),
  name: z.string(),
  shortdescription: z.string(),
  longdescription: z.string(),
})
