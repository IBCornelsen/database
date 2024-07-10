import * as z from "zod"
import * as imports from "../../../prisma/null"
import { BenutzerRolle } from "@prisma/client"

export const BenutzerSchema = z.object({
  id: z.number().int(),
  uid: z.string(),
  name: z.string().nullish(),
  vorname: z.string().nullish(),
  email: z.string(),
  passwort: z.string(),
  profilbild: z.string().nullish(),
  plz: z.string().nullish(),
  ort: z.string().nullish(),
  adresse: z.string().nullish(),
  telefon: z.string().nullish(),
  anrede: z.string().nullish(),
  rolle: z.nativeEnum(BenutzerRolle),
})
