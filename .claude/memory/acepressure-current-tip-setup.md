---
name: acepressure-current-tip-setup
description: "Owner's own YouTube channel uses AcePressure (github.com/atulsharma568/acepressure-next) today and will move to Tipsite later"
metadata:
  node_type: memory
  type: project
  originSessionId: cff77318-f74f-4503-8601-fd720427f335
  modified: 2026-10-14T15:54:22.651Z
---

The owner streams as AcePressure (Valorant, YouTube) and currently takes tips through their self-hosted AcePressure app: Flask + SQLite on a Windows PC, Tailscale Funnel, direct UPI with odd-paise matching, and an iPhone Shortcut forwarding Paytm "Received ₹" notifications to `/api/bridge/paytm`. Stated 2026-10-14: they will eventually host their own channel on Tipsite, but use AcePressure for now.

**Why:** Tipsite's tip page/backend should later be able to take over this channel (alerts, TTS, sound library, history), so AcePressure's features and data are a migration source.
**How to apply:** When planning Tipsite's tip page or backend, consider importing AcePressure history and matching its OBS/TTS behaviour. Review of 2026-10-14 found: live matcher rejects comma amounts (₹1,000+), `Start_Next.bat` never builds Next, and same-minute payments always go to review. See [[work-only-in-tipsite-repo]]: ask before editing that repo.
