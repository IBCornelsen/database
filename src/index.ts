import { PrismaClient } from "@prisma/client";

export * from "@prisma/client";
export * from "./types/fake-data"
export * from "./generated/zod/index";

export const prisma = new PrismaClient({
	log: ["query", "info", "warn"],
	errorFormat: "pretty"
})