# 02 · Reconstructing the Milan 2025 Current State

Discovery for a past event means reconstructing it: from your own records, from teammates' memories, and from honest estimates where nothing was recorded. Every number gets a source label so nobody mistakes an estimate for a measurement.

**Source labels:** **R** = from a record (sheet, chat timestamp, invoice) · **T** = a teammate's recollection · **E** = my own estimate

## 1. Sources to gather (privately — never into the repo)

| Source | What it gives | Where to find it |
|---|---|---|
| Pronites records (my own) | Artist shortlist, fees, advances, contracts, riders, vendor quotes | Email, Drive, WhatsApp |
| Milan 2025 budget sheet | Department split, budget vs spend at close | Finance Head / core Drive |
| Approval chats | Request and approval timestamps | Core and department WhatsApp groups |
| Sponsor tracker / MoUs | Sponsors, tiers, amounts, payment dates | Sponsorship head |
| Merch records | Stock ordered, sold, leftover | Merch head |
| Final accounts | When they were completed | Finance Head |

Ask before using anything that isn't yours, and keep it off GitHub.

## 2. Recall questions

### Me (Head of Pronites) — write the answers down first
1. Walk through booking each artist: who approved, how long it took, how the advance and balance were paid.
2. When did I last know exactly how much of the Pronites budget was left? How did I find out?
3. What went wrong with an artist payment, rider or vendor, and what did it cost in time or money?
4. Which purchases waited on an approval, and for how long?

### Finance Head / Treasurer (20 min)
1. Where was the budget kept and how often was "spent so far" updated?
2. Walk me through the largest purchase from request to payment. Who approved at each step?
3. Were three quotations needed? Above what amount? Was faculty approval needed above a limit?
4. How much sponsor money was still pending a month after the fest?
5. How long did the final accounts take after the fest? What was hardest?
6. Was GST charged on sponsorships, and was TDS deducted on artist fees?

### Overall Coordinator (20 min)
1. How did you know whether a department was on track?
2. Which departments went over budget, and when did you find out?
3. Should departments have seen each other's budgets?

## 3. Reconstructed baseline

Fill the "Milan 2025" column in [`11-metrics.md`](11-metrics.md) and the workbook's *Baseline & Metrics* sheet.

| # | Metric | How to reconstruct it | Label |
|---|---|---|---|
| B1 | Request-to-approval time | Timestamps of request and approval messages for ~10 purchases | R |
| B2 | Time to answer "what can Dept X still spend?" | Ask the 2025 Finance Head how they'd have answered and how long it took | T |
| B3 | Departments over budget at close | Final 2025 budget sheet | R / T |
| B4 | Payments without a documented approval | Count from the last ~20 payments in chats/sheet | R / E |
| B5 | Sponsor money pending 30 days after the fest | Sponsor tracker or Finance Head | R / T |
| B6 | Reimbursement turnaround | Claim and payment dates for ~10 claims | R / T |
| B7 | Merch stock mismatch | Stock ordered − sold − leftover | R / E |
| B8 | Days to final accounts after the fest | Finance Head | T |

If something can't be reconstructed, write **"not tracked"** — that absence is itself a finding.

## 4. Notes template

| Date | Source (role) | Finding (their words) | Requirement it implies | Label |
|---|---|---|---|---|
| | | | | |
