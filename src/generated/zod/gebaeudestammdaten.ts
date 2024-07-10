import * as z from "zod"
import * as imports from "../../../prisma/null"

export const GebaeudeStammdatenSchema = z.object({
  id: z.number().int(),
  uid: z.string(),
  benutzer_id: z.number().int().nullish(),
  latitude: z.number().nullish(),
  longitude: z.number().nullish(),
  plz: z.string().describe("Postleitzahl des Gebäudes").nullish(),
  ort: z.string().describe("Ort des Gebäudes").nullish(),
  adresse: z.string().describe("Adresse (Straße und Hausnummer) des Gebäudes").nullish(),
})
