import type { APIRoute } from 'astro';
import { db } from '../../lib/db';

export const GET: APIRoute = async (_context) => {
  let res = await db.ingredient.findFirst({
    include: {
      ingredientInfo: true,
    },
  });

  return new Response(JSON.stringify(res), {
    status: 200,
  });
};
