import { PrismaClient } from "@prisma/client";


export * from ".prisma/client/index.d";
export * from "./types/fake-data"
export const prisma = new PrismaClient()