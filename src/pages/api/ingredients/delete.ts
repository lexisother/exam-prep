import type { APIRoute } from 'astro';
import { json } from '../../../lib/util';
import { db } from '../../../lib/db';

interface Data {
  id: string;
}

export const POST: APIRoute = async (context) => {
  const res = await json<Data>(context.request);

  console.log(res.id);

  try {
    await db.ingredient.delete({
      where: {
        id: Number(res.id),
      },
      include: {
        ingredientInfo: true,
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
