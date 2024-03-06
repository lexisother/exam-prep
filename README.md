god only knows

## Setup instructions

1. `pnpm i`
2. Put `DB_URL=mysql://root:db@127.0.0.1:3306/db` in `.env`
3. `docker compose up -d`
4. `pnpm prisma:gen && pnpm migrate:dev`
5. `pnpm dev`
