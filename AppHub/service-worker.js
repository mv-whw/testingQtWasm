// service-worker.js
self.addEventListener('install', () => self.skipWaiting());
self.addEventListener('activate', () => self.clients.claim());

self.addEventListener('fetch', (event) => {
  event.respondWith((async () => {
    const response = await fetch(event.request);
    const newHeaders = new Headers(response.headers);

    newHeaders.set("Cross-Origin-Opener-Policy", "same-origin");
    newHeaders.set("Cross-Origin-Embedder-Policy", "require-corp");

    const blob = await response.blob();
    return new Response(blob, {
      status: response.status,
      statusText: response.statusText,
      headers: newHeaders
    });
  })());
});
