@AGENTS.md

## Working agreement

- Read `PROGRESS.md` first: it has the current state, decisions, open questions and the log. The next steps are in this file.
- When a change is finished and verified (lint, type check and build pass), update `PROGRESS.md`, then commit and push to `main` without asking. This is the owner's standing instruction for this repo.
- Never force-push and never bypass commit or push hooks. If a hook or the push fails, stop and report.
- Commit unsigned (owner-approved) as the owner's GitHub no-reply identity (see `git log`), never a work email. Everything pushed is public, so keep secrets and company details out of commits.
- `package-lock.json` must only reference `https://registry.npmjs.org/`; rewrite any private-mirror URLs before committing.
- Keep the "Next steps" list below current: tick off or rewrite items as work finishes.

## Next steps (as of 2026-10-23)

1. Decided: Razorpay's charges sit on top of the 5% and are paid by the creator out of the payout; fans pay exactly the tip (owner, 2026-10-14). At Razorpay's standard rate (2% + 18% GST on that charge) a ₹100 tip leaves the creator ₹92.64. The worked example is on the fee tile and in the FAQ; re-check Razorpay's rate before launch.
2. Hero hands: polished version committed and approved "for now" on 2026-10-14; the owner said it is not yet what they imagined, so expect a revision request.
3. Waitlist live (2026-10-16): deployed at https://tipsite.vercel.app (Vercel, server in Singapore `sin1`) with Neon Postgres in AWS Singapore. Live checks passed 2026-10-16: sign-up saves to Neon, WhatsApp preview works, PageSpeed accessibility 100 (performance was 86 before the hero LCP fix; re-run to confirm). Possible later: shorten the hero's opening animation to lower Speed Index. Launch emails to the list are not built.
4. Choose the product name and domain. "Tipsite" and `tipsite.in` are placeholders. When the domain is live, set `NEXT_PUBLIC_SITE_URL` in Vercel (robots.txt blocks search engines until then) and run PageSpeed Insights on it.
5. Legal pages drafted (2026-10-14): terms, privacy, refunds, delivery, contact and grievances, pricing, about, and a footer on every page. Before launch or a Razorpay application: the owner fills in operator details in `src/lib/legal.ts`, confirms the default timelines and the 18+ rule listed in `PROGRESS.md`, gets a lawyer to review, then sets `LEGAL_DRAFT` to false.
6. FAQ is finished for now (2026-10-14); revisit the fee and payout answers once those decisions are made, and write the legal copy.
7. Still undecided, so they must not appear on the page: payout timing, paid highlighted messages.
8. [Done for first slice 2026-10-22] Read-only owner-finance foundation is in place: `db/migrations/0001_finance_foundation.sql`, server-side owner authorization through `OWNER_GOOGLE_IDS`, protected `/admin` overview/finance/reconciliation/audit pages, honest empty states and focused route coverage. Do not integrate Razorpay or create fake financial data in this slice.
9. [Done 2026-10-22/23] Creator onboarding, Razorpay activation gate, payment flow and visual OBS alerts (1080p, 2K, vertical; instant/split/approve modes) are built. Run migrations 0007 to 0009 in Neon. Next slices, in order: (a) [Built 2026-10-23, not yet heard: run migration 0010, add `POLLY_ACCESS_KEY_ID` and `POLLY_SECRET_ACCESS_KEY` in Vercel, then test in real OBS] text-to-speech on the overlay (English and Hindi), (b) fix the six stale desktop tests (the `/signup` waitlist and metadata tests, and the skip-link test on `/kabirplays`), (c) payouts, refunds and settlements, which remain undecided.
10. Competitor findings are maintained in `docs/competitor-findings.md`. The 2026-10-22 REA pass covered public StreamTipz, SuperTips and HyperChat surfaces; authenticated dashboards and private backends remain unknown.
11. [Done 2026-10-21] Sign-in: Google OAuth with YouTube scope (`next-auth` v5). Run `db/schema-users.sql` in Neon and add `AUTH_SECRET`, `AUTH_GOOGLE_ID`, `AUTH_GOOGLE_SECRET` to Vercel. Add `https://tipsite.vercel.app/api/auth/callback/google` as an authorised redirect URI in Google Cloud Console.
12. Owner to check the site on a real phone (Android and, if possible, an iPhone) with the checklist given on 2026-10-14; the emulated low-end Android pass is done and logged in `PROGRESS.md`.

## Direction from the owner

- The site should be clean, professional and to the point: only what is necessary, not everything the reference sites show, and something new and unique.
- Hero animation idea (the owner's): two hands enter from opposite sides, one hands over cash, the other takes it and both pull back. Status: GSAP SVG version committed on 2026-10-14, approved "for now"; may be revised.
- Competitor-led landing direction (owner, 2026-10-14): make no fan account or email, optional anonymous tips, QR-first sharing and safer approved text-to-speech the visible reasons to choose Tipsite. The landing-page section is built; the real tip-page controls are still future work.
- Recommended approach, not yet approved by the owner:
  - flat SVG hands in our palette (lighter and sharper than 3D or video);
  - the cash is a lime ₹ note, not a realistic bill, because the product is UPI and card;
  - about 2.5 seconds, played once, choreographed with the headline lines and the tip card so only one thing moves at a time;
  - it must not delay the headline or the button, must work at 320px, and shows a still frame under reduced motion;
  - prototype first; if the hands look cheap, drop it or use the note travelling between the card and the alert instead.

## Research findings (competitor review, updated 2026-10-22)

The detailed and latest findings are in `docs/competitor-findings.md`. The public REA evidence shows three different models: StreamTipz as direct UPI routing, SuperTips as creator monetisation plus community tooling, and HyperChat as realtime interaction infrastructure. These facts are public-surface observations only; re-check pages before quoting changing prices or claims.

- Hyperchat: fee, payout and KYC terms not published. Tips priced by type (text ₹40, voice ₹150, sound ₹30, media ₹100), text-to-speech, a 44-clip soundboard, 70-character messages, themed creator pages.
- StreamTipz: 5% or 7% through prepaid "Alert Tokens" (its fee pages disagree). UPI only, fan email required, 30-character messages, a savings calculator.
- SuperTips: Free plan at 8%, Pro at ₹999/month for 6%. UPI only. OBS alerts, goals, leaderboard, fan CRM, banned words, 150-character messages. The fan form pre-selects ₹200 and requires an email.

## Competitor decisions (2026-10-14)

### Strengths we kept or adapted

- A short creator link and a simple fan path from link to tip.
- UPI as the primary Indian payment method, plus card payment in the same flow.
- OBS alerts with the fan's name, amount and message.
- Text-to-speech as a stream feature, paired with message moderation rather than treating every message as safe.
- Clear sample amounts and message limits so the fan form is easy to understand.

### Weaknesses and defaults we rejected

- No fan email requirement and no fan account requirement.
- No UPI-only flow; card support remains part of the planned product.
- No conflicting fee or payout claims; the page says only the confirmed 5% platform fee.
- No fabricated creator counts, testimonials, logos, payout timing or customer proof.
- No soundboard, XP, leaderboard, fan CRM, paid highlighted messages or large feature catalogue in the first landing page.

The landing page now shows the adopted strengths and our own edges as labelled samples or product direction. The actual payment, moderation, approval and creator tools are still future work.

Where we can be clearly better (landing direction, owner-approved 2026-10-14):

1. One flat, plainly stated fee (5% of every tip) with a worked example (built: ₹100 → ₹92.64 after our 5% and Razorpay's charge).
2. UPI and card, no fan email, an optional anonymous tip.
3. Safe text-to-speech: message limit, profanity filter, banned words, approve-before-play.
4. A QR code per streamer to show on stream (none of the three showed one).
5. Honest trust: samples labelled as samples, real names and numbers only once they exist, plus company, contact, terms, privacy and refund details.
6. A clean phone layout (ours has no overflow from 320 to 1440px) and a look that cannot be confused with theirs (near-black and lime against their violet, cyan and light blue).

## Current landing scope (owner direction, 2026-10-14)

Implemented sections: hero (headline, self-playing sample tip card, handoff animation, sample alert fan on wide screens) → how it works (4 steps: claim, share, go live, get paid) → on your stream (sample OBS alert) → why Tipsite (no fan email/account, anonymous option, UPI + card, labelled sample QR, safer approved text-to-speech) → fees ("5% of every tip") → FAQ → closing waitlist form and footer navigation. Draft legal and contact pages exist.

Still planned: the fan tip page, creator dashboard, accounts, the rest of the backend and payments.

Leave out: counters and "10,000+ creators" strips, logo walls, testimonials we do not have, a grid of every feature, jargon, naming competitors, pop-ups. Soundboards, XP levels, leaderboards and fan CRM stay off the page.

Product, first version (when the tip page is built):

- Must have: handle page, UPI and card, OBS alert link, text-to-speech (English and Hindi), message limit, profanity filter and banned words, minimum tip.
- Our edge: QR code, anonymous option, no fan email, approve-before-play.
- Later: goals, media and voice tips, XP levels, fan CRM, soundboard.

Optional idea: a "try it" box where a visitor types a name and message, sees the alert and hears it read aloud (the browser can speak, so no backend is needed).

## UI references (owner, 2026-10-14)

- The owner shared threeui.com, 21st.dev, tasteskill.dev and gsap.com as references. ThreeUI is paid (Pro) and heavy (Three.js, about 55 MB package); 21st.dev licences vary by author. Use both only as visual inspiration and write our own code, since this repo is public.
- Built so far (owner-picked): the flat beam button, the "Tip anonymously" switch in the sample card, the stepped-ticks loader (now on the waitlist submit buttons), and the letter-roll hover on pill buttons. Also built (owner-picked from ThreeUI): odometer reels for the success amount, a floating capsule nav with a sliding lime link highlight, and an arrow-endcap hero CTA. From ThreeUI's (Pro, Three.js) hero and motion pages, adapted flat: a fanned stack of sample alerts behind the hero card, a rolling "5%" fee odometer, a pinned sideways steps rail with a lime progress line, and a stream screen that tilts flat on scroll.
- Also built (owner request, rebuilt lighter in our own code from ThreeUI's glass AI button, skeuomorphic shader toggle, Sable top dock, uplink loader and falling-diagonal heading): a glass orb nav CTA, a plasma "Tip anonymously" switch, a frosted nav capsule with dock-style link spring, a full uplink sending panel over the tip card, and a money orbit around a glitching wordmark at the top of the closing section.
- Also built (owner request): Sign in (glass orb) and Sign up (a chrome button rebuilt from ThreeUI's get-started button) in the nav, `/signup` and `/signin` pages that say accounts aren't open yet, a typing `tipsite.in/yourname` field with a live link chip, and sample stream settings (alerts on stream, text-to-speech, approve-first) that drive the On stream sample.
- Flat by default, with one owner-approved exception (2026-10-14): those glow pieces (plus the chrome button and the handle field's focus glow) may glow, always in lime. Everything else stays flat. Taste Skill is installed but bans monospace; DESIGN.md wins where they disagree.
- GSAP 3.15 in `node_modules` includes SplitText, DrawSVG, MorphSVG, Flip and CustomEase at no cost; only ScrollTrigger is registered today.

## Tooling note

The Claude Code advisor tool (`/advisor`) is not available in the owner's setup: an environment setting that turns off experimental beta features also hides it. Do not spend time installing or enabling it. If the owner wants a stronger model for a hard task (for example the payment flow), suggest `/model opus`.
