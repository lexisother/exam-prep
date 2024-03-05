import { defineMiddleware } from 'astro:middleware';
import dayjs from 'dayjs';
import { db } from './lib/db';

export const onRequest = defineMiddleware(async (context, next) => {
  const resNotifs = [];

  const notifs = await db.notification.findMany();
  for (const notif of notifs) {
    if (!notif.read) resNotifs.push(notif);
  }

  const items = await db.ingredient.findMany({ include: { ingredientInfo: true } });
  for (const item of items) {
    const title = `${item.ingredientInfo!.name} is expiring on ${item.expirationDate.get}`;
    if (resNotifs.find((n) => n.text === title)) continue;

    const date = dayjs(item.expirationDate);
    const diff = date.diff(new Date(), 'day');
    if (diff <= 3) {
      const notif = await db.notification.create({
        data: {
          text: title,
          read: false,
        },
      });
      resNotifs.push(notif);
    }
  }

  context.locals.notifications = resNotifs;

  return next();
});
