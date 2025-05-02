FROM oven/bun:latest

WORKDIR /app
RUN apt-get update -y && apt-get install -y openssl

COPY package*.json bun.lock turbo.json ./
COPY packages ./packages
RUN bun install

COPY ./apps/ws ./apps/ws

RUN bun run db:generate

EXPOSE 8082

CMD ["bun", "run", "start:ws"]
