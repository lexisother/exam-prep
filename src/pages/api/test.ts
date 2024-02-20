import type { APIRoute } from "astro";

export const GET: APIRoute = async (_context) => {
    return new Response("lol", {
        status: 200
    })
}