---
name: project-splash-title-screen
description: "Splash screen + title-screen feature shipped 2026-10-21; what was built, how it works, and what was fixed"
metadata:
  node_type: memory
  type: project
  originSessionId: e65c201c-97d8-4d1b-97ee-15d456dee303
  modified: 2026-10-21T10:42:45.079Z
---

Commits `f72dd37`–`989e32d` (2026-10-21) added a full-page splash and title-screen moment to the TipSite landing page.

**What was built:**
- `SplashScreen` component: full-viewport overlay that plays `HeroHands` (with `immediate={true}`) once on page load, fades out over 700 ms when the animation completes, then removes itself from the DOM.
- `GlobalBackground` component: fixed full-viewport canvas with orbiting ₹ notes/coins and the glitch wordmark (`SITE_NAME`). After the splash it shows at full opacity as a brief title-screen moment; on first scroll/wheel/touchmove it transitions to `blur(28px) / opacity 0.22` over 600 ms.
- `globals.css`: `.page-content` is `opacity: 0` until `body.page-scrolled` is set (added by GlobalBackground on first scroll). `.rise` and `.enter` animations inside it are paused during the hidden phase so they play from the start when visible.

**Reduced-motion path:** `HeroHands` calls `onDone` immediately → `SplashScreen.handleDone` adds `page-scrolled` to body (skipping the title-screen pause) → `GlobalBackground` checks for `page-scrolled` on mount and sinks immediately.

**Three correctness fixes applied in `989e32d`:**
1. Removed dead `splash-done` class add in `SplashScreen` (CSS already gated on `page-scrolled`).
2. Added `animation-play-state: paused` for `.rise`/`.enter` while content hidden — animations no longer fire silently during the splash.
3. `GlobalBackground` checks `document.body.classList.contains("page-scrolled")` on mount — covers the reduced-motion case where SplashScreen's layout effect runs before GlobalBackground's regular effect.

**Why:** The execution order matters: `useGSAP` (layout effect) in HeroHands fires before GlobalBackground's `useEffect`, so under reduced motion `page-scrolled` is added before GlobalBackground can register its scroll listeners.
