import * as z from "zod"

export const documenttemplatesSchema = z.object({
  id: z.number().int(),
  name: z.string(),
  shortdescription: z.string(),
  longdescription: z.string(),
  user_id: z.number().int(),
  is_private: z.boolean(),
  documenttype: z.number().int(),
  filename: z.string(),
  created_at: z.date(),
  updated_at: z.date(),
})
