import { PrismaClient } from "@prisma/client";
import { resolvers } from "./generated/type-graphql";
import { buildSchema } from "type-graphql";


export * from ".prisma/client/index.d";
export * from "./types/fake-data"
export const prisma = new PrismaClient()
export const schema = await buildSchema({
  resolvers,
  validate: false,
});