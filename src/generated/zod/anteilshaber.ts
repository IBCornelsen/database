import * as z from "zod"

export const AnteilshaberSchema = z.object({
  id: z.number().int(),
  benutzer_id: z.number().int(),
  rolle: z.string().nullish(),
  privilegien: z.bigint().nullish(),
  uid: z.string(),
  objekt_id: z.number().int(),
})
