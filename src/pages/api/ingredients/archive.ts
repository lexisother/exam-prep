import type { APIRoute } from 'astro';
import { json } from '../../../lib/util';
import { db } from '../../../lib/db';

interface Data {
  id: string;
  archived: string;
}

export const POST: APIRoute = async (context) => {
  const res = await json<Data>(context.request);

  console.log(res);

  try {
    await db.ingredient.update({
      where: {
        id: Number(res.id),
      },
      data: {
        // FUUUUUUUUUCK
        // eslint-disable-next-line no-unneeded-ternary
        archived: !res.archived,
      },
    });
  } catch (e) {
    return new Response(
      JSON.stringify({
        success: false,
        error: e,
      }),
    );
  }

  return new Response(
    JSON.stringify({
      success: true,
      error: null,
    }),
  );
};
