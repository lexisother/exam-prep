export function json<T>(req: Request): Promise<T> {
  return req.json() as Promise<T>;
}
