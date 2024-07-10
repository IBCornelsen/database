import * as z from "zod"
import * as imports from "../../../prisma/null"

export const GebaeudePlaeneSchema = z.object({
  id: z.number().int(),
  gebaeude_stammdaten_id: z.number().int(),
  uid: z.string(),
})
