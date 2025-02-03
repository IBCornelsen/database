import * as z from "zod"

export const tokensSchema = z.object({
  id: z.number().int(),
  token: z.string(),
  user_id: z.number().int(),
  date_created: z.date(),
  last_used: z.date(),
  times_used: z.number().int(),
  permissions: z.number().int(),
})
