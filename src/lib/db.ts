import { Prisma, PrismaClient } from '@prisma/client';

export const db = new PrismaClient();

// Types {{{
// see: <https://www.prisma.io/docs/orm/prisma-client/type-safety/operating-against-partial-structures-of-model-types>
const ingredientWithInfo = Prisma.validator<Prisma.IngredientDefaultArgs>()({
  include: { ingredientInfo: true },
});

export type IngredientWithInfo = Prisma.IngredientGetPayload<typeof ingredientWithInfo>;
// }}}
