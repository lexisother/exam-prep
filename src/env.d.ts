/// <reference path="../.astro/types.d.ts" />
/// <reference types="astro/client" />
interface NotifData {
  id: number;
  text: string;
  read: boolean;
}

namespace App {
  interface Locals {
    notifications: NotifData[];
  }
}
