import * as z from "zod"
import * as imports from "../../../prisma/null"

export const documenttypesSchema = z.object({
  id: z.number().int(),
  name: z.string(),
  shortdescription: z.string(),
  longdescription: z.string(),
})
