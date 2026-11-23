# 10 · Rollout Plan (proposed for a future Milan team)

This rebuild was not deployed. This page is the go-live plan a future Milan team would follow to put it into use — the part of an implementation that happens after testing. `F` = the fest's first day.

## 1. Readiness checklist (F − 5 weeks)

| # | Item | Owner |
|---|---|---|
| 1 | All must-have UAT cases passed on the team's own site | Implementer + Finance Head |
| 2 | Real budgets entered, matching the approved budget sheet to the rupee | Finance Head |
| 3 | Real suppliers, sponsors and items imported; migration log complete | Implementer |
| 4 | Every user created with the right role profile and cost-center permission | Implementer |
| 5 | Each role group trained using the SOPs; attendance recorded | Implementer |
| 6 | Workflow emails reach Finance Head and Faculty (test sent and received) | Implementer |
| 7 | Manual backup downloaded | Implementer |
| 8 | Hosting paid beyond the trial | Coordinators |
| 9 | Demo transactions deleted before real entries (Delete Company Transactions) | Implementer |
| 10 | Coordinators announce: "from [date], requests not in ERPNext won't be approved" | Coordinators |

**Go / no-go:** Coordinators, Finance Head and implementer, 15 minutes; go only if items 1–9 are done.

## 2. Cutover

| Day | Activity |
|---|---|
| Go-live − 1 | Freeze the budget sheet; enter orders already placed and advances already paid, dated go-live day |
| Day 1–3 | **Parallel run:** every new request goes into ERPNext *and* the old sheet; totals compared each evening |
| Day 4 | If totals matched for 3 days, archive the sheet read-only |
| Day 4 onward | ERPNext only |

## 3. Hypercare (go-live to F + 1 week)

- Daily 15-minute check with the Finance Head; in person during fest week.
- A "Milan ERP Help" WhatsApp group; answer within 2 hours; log non-trivial issues below.
- Every Monday, the Department Spend Tracker emailed to Coordinators (Auto Email Report).
- Someone at the merch counter on the first fest day to fix POS issues on the spot.

## 4. Issue log

The rebuild's own UAT issues are logged here and in the workbook's **Issue Log** sheet; a live rollout would continue the same log.

| ID | Date | Found by (role) | Area | Issue | Severity (H/M/L) | Root cause | Fix | Closed on |
|---|---|---|---|---|---|---|---|---|
| ISS-01 | | | | | | | | |

**Severity:** H = someone can't do their job / money at risk · M = workaround exists · L = cosmetic or training.
**Root cause types:** Configuration, Data, Training, Product limitation.

## 5. Closing the fest in ERPNext (F + 1 to F + 3 weeks)

1. Book every remaining vendor invoice against its PO; close POs that won't be billed.
2. Record all sponsor payments; list what's outstanding with the Sponsorship Head.
3. Last POS closing entry; count leftover merch; Stock Reconciliation for any difference.
4. Profit and Loss by cost center → the final department-wise accounts.
5. Export the Spend Tracker, P&L and receivables as PDFs for the faculty-in-charge.
6. Hand admin access, backup, SOPs and hosting renewal to the next Finance Head.
