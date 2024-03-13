# Kookkelder (god only knows)

This repository is a read-only subtree split of my project for the first exam preparation project
for school.

In our team of four, each one of us had to make a part of the project, for me this was ingredient
management and notifications when certain ingredients were near their expiry date.

The project's very rudimentary as I didn't implement the design we had agreed on, neither did I
bother making anything look nice myself. It had to be functional, and that's where I drew the limit.

For the second and final exam preparation project, see
[here](https://github.com/lexisother/exam-prep-2).

## Setup instructions

1. `pnpm i`
2. Put `DB_URL=mysql://root:db@127.0.0.1:3306/db` in `.env`
3. `docker compose up -d`
4. `pnpm prisma:gen && pnpm migrate:dev`
5. `pnpm dev`
