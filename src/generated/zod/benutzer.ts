import * as z from "zod"
import { BenutzerRolle } from "@prisma/client"

export const BenutzerSchema = z.object({
  id: z.number().int(),
  uid: z.string(),
  name: z.string().nullable(),
  vorname: z.string().nullable(),
  email: z.string(),
  passwort: z.string(),
  profilbild: z.string().nullable(),
  plz: z.string().nullable(),
  ort: z.string().nullable(),
  adresse: z.string().nullable(),
  telefon: z.string().nullable(),
  anrede: z.string().nullable(),
  rolle: z.nativeEnum(BenutzerRolle),
})
