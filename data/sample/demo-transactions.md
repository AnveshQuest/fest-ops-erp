# Sample transactions for UAT and the demo

All amounts are illustrative, with no GST, and use the sample masters in this folder. Enter them in this order on a fresh site after the configuration runbook; they drive UAT cases 01–20 and the demo video.

| # | Document | Party | Lines | Total | Cost center | Expected outcome |
|---|---|---|---|---|---|---|
| T1 | Purchase Order | SoundLight Vendor 1 | 2 × SLS-NIGHT @ ₹1,40,000 | ₹2,80,000 | Pronites | Needs quotes ticked; escalates to Faculty; approved |
| T2 | Purchase Order (Artist 50-50) | Agency B (EDM headliner) | 1 × ART-FEE @ ₹6,00,000 | ₹6,00,000 | Pronites | Escalates to Faculty; approved; Contract linked |
| T3 | Payment Entry (advance) | Agency B | 50% of T2 | ₹3,00,000 | — | PO shows advance paid; no expense booked yet |
| T4 | Purchase Order (Artist 50-50) | Agency A (Sufi act) | 1 × ART-FEE @ ₹2,50,000 | ₹2,50,000 | Pronites | Approved via Faculty |
| T5 | Purchase Order | Artist C (stand-up) | 1 × ART-FEE @ ₹80,000 | ₹80,000 | Pronites | **Blocked by budget**: Artist Fees would reach ₹9,30,000 vs ₹9,00,000 |
| T6 | Purchase Order | Caterer 1 | 1,200 × CAT-PLATE @ ₹180 | ₹2,16,000 | Hospitality | Quotes required; escalates to Faculty; approved |
| T7 | Purchase Order → Purchase Invoice | Print Shop 1 | 800 × PRN-FLEX @ ₹14 | ₹11,200 | Marketing & Design | Approved by Finance Head only; billed in full |
| T8 | Purchase Order | Trophy Shop 1 | 20 × TRO-WIN @ ₹1,800 | ₹36,000 | Sports | Approved by Finance Head only |
| T9 | Purchase Invoice | Student Reimbursements | 1 × REIMB @ ₹1,850 (bill attached) | ₹1,850 | Technical (account: Event Materials) | Reimbursement booked as actual expense |
| T10 | Sales Invoice (Sponsor 50-50) | Title Sponsor – FinTech Co | 1 × SPN-TITLE @ ₹5,00,000 | ₹5,00,000 | — | Two payment-schedule rows of ₹2,50,000 |
| T11 | Payment Entry (receive) | Title Sponsor – FinTech Co | First instalment | ₹2,50,000 | — | Outstanding ₹2,50,000 |
| T12 | Sales Invoice | Associate Sponsor – EdTech Co | 1 × SPN-ASSOC @ ₹2,00,000 | ₹2,00,000 | — | Outstanding ₹2,00,000 |
| T13 | POS Invoice | Walk-in Merch Buyer | 2 × MER-TEE-M, 1 × MER-BAND, UPI | ₹847 | Merchandise | Stock of MER-TEE-M 120 → 118 |
| T14 | POS Invoice | Walk-in Merch Buyer | 1 × MER-HOOD-L, Cash | ₹899 | Merchandise | Stock of MER-HOOD-L 40 → 39 |
| T15 | POS Closing Entry | — | Day close | Cash ₹899, UPI ₹847 | — | Totals match |

## Expected Department Spend Tracker after T1–T15

| Department | Budget | Committed | Actual | Available | Used % |
|---|---|---|---|---|---|
| Pronites | ₹14,00,000 | ₹11,30,000 | ₹0 | ₹2,70,000 | 80.7% |
| Hospitality | ₹4,00,000 | ₹2,16,000 | ₹0 | ₹1,84,000 | 54.0% |
| Sports | ₹4,50,000 | ₹36,000 | ₹0 | ₹4,14,000 | 8.0% |
| Marketing & Design | ₹2,00,000 | ₹0 | ₹11,200 | ₹1,88,800 | 5.6% |
| Technical | ₹1,50,000 | ₹0 | ₹1,850 | ₹1,48,150 | 1.2% |
| Cultural | ₹3,00,000 | ₹0 | ₹0 | ₹3,00,000 | 0.0% |
| Production & Logistics | ₹5,50,000 | ₹0 | ₹0 | ₹5,50,000 | 0.0% |
| Security | ₹2,50,000 | ₹0 | ₹0 | ₹2,50,000 | 0.0% |
| Finance & Admin | ₹1,00,000 | ₹0 | ₹0 | ₹1,00,000 | 0.0% |
| Contingency | ₹2,00,000 | ₹0 | ₹0 | ₹2,00,000 | 0.0% |
| **Total** | **₹40,00,000** | **₹13,82,000** | **₹13,050** | **₹26,04,950** | **34.9%** |

Notes
- T3 is an advance against an order, so it reduces what is owed to Agency B but is not an expense until the artist's invoice is booked.
- Merchandise has no expense budget (stock purchases are funded from merch sales), so it doesn't appear in the tracker.
