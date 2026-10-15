import { expect, test, type Page } from "@playwright/test";

const widths = [320, 390, 1440] as const;
const publicRoutes = [
  "/",
  "/signup",
  "/signin",
  "/terms",
  "/privacy",
  "/refunds",
  "/delivery",
  "/contact",
  "/pricing",
  "/about",
];

async function documentWidth(page: Page) {
  return page.evaluate(() => ({
    viewport: window.innerWidth,
    document: document.documentElement.scrollWidth,
  }));
}

async function slowlyScrollToBottom(page: Page) {
  await page.evaluate(async () => {
    await new Promise<void>((resolve) => {
      const step = () => {
        const bottom = Math.max(0, document.documentElement.scrollHeight - window.innerHeight);
        window.scrollBy(0, Math.min(240, Math.max(0, bottom - window.scrollY)));
        if (window.scrollY >= bottom - 1) resolve();
        else window.requestAnimationFrame(step);
      };

      step();
    });
  });
}

test.describe("no horizontal overflow", () => {
  for (const route of publicRoutes) {
    test(`${route} stays within 320, 390, and 1440px viewports`, async ({ page }) => {
      for (const width of widths) {
        await page.setViewportSize({ width, height: 900 });
        await page.goto(route, { waitUntil: "domcontentloaded" });

        await expect.poll(() => documentWidth(page)).toEqual({
          viewport: width,
          document: width,
        });

        if (route === "/") {
          await slowlyScrollToBottom(page);
          await expect.poll(() => documentWidth(page)).toEqual({
            viewport: width,
            document: width,
          });
        }
      }
    });
  }
});
