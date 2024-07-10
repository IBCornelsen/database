import * as z from "zod"
import * as imports from "../../../prisma/null"

export const AnteilshaberSchema = z.object({
  id: z.number().int(),
  benutzer_id: z.number().int(),
  gebaeude_id: z.number().int(),
  rolle: z.string().nullish(),
  privilegien: z.bigint().nullish(),
  uid: z.string(),
})
