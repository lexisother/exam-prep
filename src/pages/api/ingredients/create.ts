import type { APIRoute } from 'astro';
import { db } from '../../../lib/db';

export const POST: APIRoute = async (context) => {
  const formData = await context.request.formData();
  const data = Object.fromEntries(
    Array.from(formData.keys()).map((key) => [
      key,
      formData.getAll(key).length > 1 ? formData.getAll(key) : formData.get(key),
    ]),
  );

  await db.ingredient.create({
    data: {
      amount: Number(data.amount),
      archived: false,
      expirationDate: new Date(String(data.expr_date)),
      ingredientInfo: {
        create: {
          name: String(data.name),
          calories: Number(data.calories),
          unit: String(data.unit),
        },
      },
    },
  });

  return new Response('Success', {
    status: 201,
  });
};
