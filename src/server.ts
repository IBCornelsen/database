import { PrismaClient } from "@prisma/client";
export type * from "@prisma/client"
export { $Enums as Enums } from "@prisma/client";
export * from "./generated/zod/index.js";

export const prisma = new PrismaClient({
	log: ["warn", "error"],
	errorFormat: "pretty",
	datasources: {
		db: {
			url: process.env.POSTGRES_DATABASE_URL,
		},
	},
});

