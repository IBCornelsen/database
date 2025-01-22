import * as z from "zod"

export const ApiRequestsSchema = z.object({
  id: z.number().int(),
  date: z.date(),
  ip: z.string(),
  method: z.string(),
  path: z.string(),
  status: z.number().int(),
  responseTime: z.number(),
  responseSize: z.number().int(),
  userAgent: z.string(),
  user_id: z.number().int().nullable(),
})
