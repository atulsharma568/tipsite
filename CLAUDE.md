@AGENTS.md

## Working agreement

- Read `PROGRESS.md` first: it has the current state, decisions, open questions and the log. The next steps are in this file.
- When a change is finished and verified (lint, type check and build pass), update `PROGRESS.md`, then commit and push to `main` without asking. This is the owner's standing instruction for this repo.
- Never force-push and never bypass commit or push hooks. If a hook or the push fails, stop and report.
- Commit unsigned (owner-approved) as the owner's GitHub no-reply identity (see `git log`), never a work email. Everything pushed is public, so keep secrets and company details out of commits.
- `package-lock.json` must only reference `https://registry.npmjs.org/`; rewrite any private-mirror URLs before committing.
- Keep the "Next steps" list below current: tick off or rewrite items as work finishes.

## Next steps (as of 2026-10-14)

1. Owner decision: do Razorpay's charges sit inside the 5% or on top of it? It decides the "what you keep" example and the fee answer in the FAQ. Put no number on the page until this is answered.
2. Hero hands: polished version committed and approved "for now" on 2026-10-14; the owner said it is not yet what they imagined, so expect a revision request.
3. Turn the claim form into a real waitlist: email plus an optional YouTube channel link. It needs somewhere to store entries; Postgres is planned.
4. Choose the product name and domain. "Tipsite" and `tipsite.in` are placeholders.
5. Add terms, privacy, refund and contact pages and a footer. Razorpay will likely ask for them.
6. FAQ is finished for now (2026-10-14); revisit the fee and payout answers once those decisions are made, and write the legal copy.
7. Still undecided, so they must not appear on the page: payout timing, paid highlighted messages, whether gateway charges sit inside the 5%.
8. Build the tip page and backend only when the owner says so.
9. Competitor teardown with REA (`npx -y --registry=https://registry.npmjs.org/ rea-agents@6.4.0`, visitor-only, throwaway Chrome profile, outputs outside the repo): Hyperchat done; SuperTips then StreamTipz paused until the owner says go; then a ranked build-first/later/left-out list.

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

## Research findings (competitor review, 2026-10-13)

Reviewed hyperchat.space, streamtipz.in and supertips.store: landing page, one creator tip page each, and mobile. These facts are from that review; re-check a page before quoting a number, since fees and pages change and some pages disagree with themselves.

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

1. One flat, plainly stated fee (5% of every tip) with a worked example, once the gateway-charge question is answered.
2. UPI and card, no fan email, an optional anonymous tip.
3. Safe text-to-speech: message limit, profanity filter, banned words, approve-before-play.
4. A QR code per streamer to show on stream (none of the three showed one).
5. Honest trust: samples labelled as samples, real names and numbers only once they exist, plus company, contact, terms, privacy and refund details.
6. A clean phone layout (ours has no overflow from 320 to 1440px) and a look that cannot be confused with theirs (near-black and lime against their violet, cyan and light blue).

## Current landing scope (owner direction, 2026-10-14)

Implemented sections: hero (headline, self-playing sample tip card, handoff animation) → how it works (3 steps) → on your stream (sample OBS alert) → why Tipsite (no fan email/account, anonymous option, UPI + card, labelled sample QR, safer approved text-to-speech) → fees ("5% of every tip") → FAQ → closing claim form stub and footer navigation.

Still planned: a real waitlist with storage, legal/contact pages, the worked fee example after the gateway-charge decision, the fan tip page, creator dashboard, backend and payments.

Leave out: counters and "10,000+ creators" strips, logo walls, testimonials we do not have, a grid of every feature, jargon, naming competitors, pop-ups. Soundboards, XP levels, leaderboards and fan CRM stay off the page.

Product, first version (when the tip page is built):

- Must have: handle page, UPI and card, OBS alert link, text-to-speech (English and Hindi), message limit, profanity filter and banned words, minimum tip.
- Our edge: QR code, anonymous option, no fan email, approve-before-play.
- Later: goals, media and voice tips, XP levels, fan CRM, soundboard.

Optional idea: a "try it" box where a visitor types a name and message, sees the alert and hears it read aloud (the browser can speak, so no backend is needed).

## UI references (owner, 2026-10-14)

- The owner shared threeui.com, 21st.dev, tasteskill.dev and gsap.com as references. ThreeUI is paid (Pro) and heavy (Three.js, about 55 MB package); 21st.dev licences vary by author. Use both only as visual inspiration and write our own code, since this repo is public.
- Built so far (owner-picked): the flat beam button, the "Tip anonymously" switch in the sample card, the stepped-ticks loader on the card's sending step (reuse it for the waitlist submit), and the letter-roll hover on pill buttons. Proposed next from ThreeUI, awaiting the owner: rolling odometer digits for the success amount, a floating capsule nav on scroll, and an arrow-endcap primary CTA.
- Keep everything flat (owner confirmed): no glow, blended gradient or shadow. Taste Skill is installed but bans monospace; DESIGN.md wins where they disagree.
- GSAP 3.15 in `node_modules` includes SplitText, DrawSVG, MorphSVG, Flip and CustomEase at no cost; only ScrollTrigger is registered today.

## Tooling note

The Claude Code advisor tool (`/advisor`) is not available in the owner's setup: an environment setting that turns off experimental beta features also hides it. Do not spend time installing or enabling it. If the owner wants a stronger model for a hard task (for example the payment flow), suggest `/model opus`.
