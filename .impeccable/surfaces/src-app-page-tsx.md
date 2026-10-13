---
version: 1
slug: "src-app-page-tsx"
primary_target: "src/app/page.tsx"
related_targets: []
---

# Surface brief: landing page

Scope: src/app/page.tsx, the pre-launch landing page. Visitor mode: Persuade.

Audience and job: Indian YouTube live streamers deciding whether to claim a tip page. They must believe fans can go from link to paid in a few taps with UPI or card and no account, that the tip lands on their stream as an alert read out loud, and that the page is straight about money.

Action: claim a handle (stub for now: sign-up is not open).

Proof and content: the working sample tip card and the sample stream alert are the proof. No customers, testimonials, payout times or unconfirmed features exist, so none appear. The one number on the page is the owner-set fee, stated only as "We take 5% of every tip." Sample content is labeled as a sample, and the alert reuses the hero card's sample tip from src/lib/site.ts. The optional fan Name and Message fields stay because the alert shows the name and text-to-speech reads the message.

Constraints: dark and flat with one accent (user-pinned). OBS alerts and text-to-speech may be named (owner-confirmed); highlighted messages, payout timing and gateway-fee treatment may not. Landing page only: no tip page or backend yet. GSAP, Lenis and React Bits for motion. Reduced motion honored.

Memorable moment: the sample tip card plays itself and lights the three headline beats in turn, then floods lime with the tip amount. Second beat, further down: the sample stream alert wipes in and lights its message word by word, as text-to-speech would read it.

Unresolved: product name (placeholder Tipsite), domain, whether Razorpay charges sit inside the 5% or on top, payout timing, sign-up mechanism, paid highlighted messages (unconfirmed), message length limit and moderation for text-to-speech.

## Direction contract

THESIS: The page is built around the moment a tip lands: one flat lime field, one big numeral, nothing decorative. It refuses the streamer-tool default of glowing neon cards, mesh gradients and a grid of feature cards.

OWN-WORLD: Warm-tinted near-black ground, off-white text, one lime accent used as full fields (the card's success state, the stream alert, the UPI tile, the closing section), never as a glow. Bricolage Grotesque in its condensed width for display, Geist for text, Geist Mono for amounts and the handle only. One radius rule: pill controls, 20px surfaces, 12px inputs; the one exception is the closing handle field, a pill because it pairs with the pill claim button. Hairline borders, no gradients, no shadows. Phosphor icons.

STORY: A live streamer sees a fan pay in a few taps, with UPI and no account, sees the tip land on stream as an alert that is read out loud, and reads plain words about fees. They believe it is simple and honest, and claim a handle.

FIRST VIEWPORT: One-line nav with the claim button at right. Left, bottom-aligned: the headline as three stacked one-line beats, "Your link." "Their UPI." "Your bank.", near 6rem (three lines rather than two so each beat can light on its own), a two-sentence subline, a pill CTA and a text link. Right, starting higher than the headline: the live sample tip card at about 26rem wide, headed by the line "Sample page. No payment is taken." Its demo plays once, starting when the card is half in view (at once beside the headline on desktop, after a short scroll on stacked layouts), and turns each headline beat lime in turn.

FORM: User-pinned dark, flat, one-accent direction. concept-seed was not run because a pinned direction beats the roll. Seed key: none.

FINISH: unreviewed and undocumented is unfinished; this build ends with the finish review, the verdict, DESIGN.md, and every shipping raster carrying its provenance.
