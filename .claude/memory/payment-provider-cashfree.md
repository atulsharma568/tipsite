---
name: payment-provider-razorpay
description: "Payment provider is Razorpay. Fee structure and what to show creators."
metadata:
  node_type: memory
  type: project
  originSessionId: d62b6448-3632-4e11-8ecc-06732751ccd7
  modified: 2026-10-21T16:43:46.274Z
---

Payment provider is **Razorpay** (switched from Cashfree on 2026-10-21).

Cashfree and PayU were rejected because both require an annual/subscription fee; Razorpay has no annual fee and charges only per transaction. Razorpay also has a higher UPI success rate (~93% vs ~80–85%) and lower total cost at early volumes.

Fee structure:
- Platform fee: 5% (Tipsite's cut)
- Razorpay standard rate: 2% + 18% GST on that 2% ≈ 2.36% of the tip
- Combined creator payout on ₹100 tip: ₹92.64 (5% + 2.36% deducted)
- Do NOT mention Razorpay by name on the site — just show the fee percentage to creators
- Fans pay exactly the tip amount; charges come out of the creator's payout

**Why:** Razorpay has no annual fee; Cashfree and PayU have yearly subscription costs that aren't worth it at early volumes.

**How to apply:** Use Razorpay SDK/API for payment integration. The fee tile and FAQ already show the correct ₹92.64 example. Do not name the payment provider on any public-facing page. KYC wizard is at /tmp/razorpay-kyc-wizard.sh.
