import { NextResponse } from "next/server";
import { prismaClient } from "db/client";

export async function GET() {
  // eslint-disable-next-line turbo/no-undeclared-env-vars
  console.log("DATABASE_URL:", process.env.DATABASE_URL); // Debugging
  const users = await prismaClient.user.findMany({});
  return NextResponse.json(users);
}
