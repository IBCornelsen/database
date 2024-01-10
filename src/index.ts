import { PrismaClient } from "@prisma/client";

export type * from "@prisma/client"
export { $Enums as Enums } from "@prisma/client";
export * from "./generated/zod/index";

export const prisma = new PrismaClient({
	log: ["query", "info", "warn"],
	errorFormat: "pretty"
})