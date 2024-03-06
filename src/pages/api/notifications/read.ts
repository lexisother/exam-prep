import type { APIRoute } from 'astro';
import { json } from '../../../lib/util';
import { db } from '../../../lib/db';

interface Data {
  id: string;
  read: boolean;
}

export const POST: APIRoute = async (context) => {
  const res = await json<Data>(context.request);

  try {
    await db.notification.update({
      where: {
        id: Number(res.id),
      },
      data: {
        read: !res.read,
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
