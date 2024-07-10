import * as z from "zod"
import * as imports from "../../../prisma/null"
import { TicketStatus } from "@prisma/client"

// Helper schema for JSON fields
type Literal = boolean | number | string
type Json = Literal | { [key: string]: Json } | Json[]
const literalSchema = z.union([z.string(), z.number(), z.boolean()])
const jsonSchema: z.ZodSchema<Json> = z.lazy(() => z.union([literalSchema, z.array(jsonSchema), z.record(jsonSchema)]))

export const TicketsSchema = z.object({
  id: z.number().int(),
  uid: z.string(),
  benutzer_id: z.number().int().nullish(),
  created_at: z.date(),
  updated_at: z.date().nullish(),
  deleted_at: z.date().nullish(),
  status: z.nativeEnum(TicketStatus),
  titel: z.string(),
  beschreibung: z.string(),
  metadata: jsonSchema,
  email: z.string(),
  bearbeiter_id: z.number().int().nullish(),
  prioritaet: z.number().int().nullish(),
})
