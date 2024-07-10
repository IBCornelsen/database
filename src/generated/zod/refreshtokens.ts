import * as z from "zod"
import * as imports from "../../../prisma/null"

export const RefreshTokensSchema = z.object({
  id: z.number().int(),
  benutzer_id: z.number().int(),
  token: z.string(),
  ip: z.string(),
  expiry: z.date(),
})
