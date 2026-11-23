# 11 · Metrics: Milan 2025 vs the Rebuild

The left column is how Milan 2025 actually performed, reconstructed with a source label: **R** = record, **T** = teammate's recollection, **E** = own estimate. The right column is measured on the rebuild's demo system running the same task. Never present the right column as a result from a live fest.

## 1. Comparison

| # | Metric | Milan 2025 (reconstructed) | Source | Rebuild (measured on demo) | How the rebuild is measured |
|---|---|---|---|---|---|
| B1 | Request-to-approval time | | | | Workflow steps and approvers needed; the system itself adds no wait |
| B2 | Time to answer "what can Dept X still spend?" | | | | Stopwatch: open Spend Tracker, read the row |
| B3 | Departments over budget at close | | | | Over-budget POs the system blocks in UAT-02 (designed to be 0) |
| B4 | Payments without a documented approval | | | | POs that can be submitted without the workflow (should be 0) |
| B5 | Sponsor money pending 30 days after the fest | | | | Visible on day 1 in receivables ageing (tracked vs untracked) |
| B6 | Reimbursement turnaround | | | | Steps from bill to payment in the rebuild |
| B7 | Merch stock mismatch | | | | POS closing difference in UAT-17 |
| B8 | Days to final accounts after the fest | | | | Time to produce P&L by cost center from the demo data |

Some rebuild figures are about **capability** (it was untracked, now it's visible) rather than a faster number. Say that plainly; "went from untracked to visible in one report" is a real result.

## 2. Implementation metrics (all measured on the rebuild)

| Metric | Value |
|---|---|
| Requirements captured | 26 functional, 5 non-functional |
| Fit-gap result | 9 standard, 12 configuration, 1 custom, 2 workarounds, 2 to confirm |
| Suppliers / sponsors / items migrated | 16 / 7 / 28 (reconstructed, anonymised) |
| Budgets loaded | 16 budgets, ₹40,00,000 (anonymised scale) |
| UAT cases passed | / 20 |
| Issues logged during testing (by root cause) | |
| Teammates who reviewed the AS-IS / demo | |

## 3. Rules

- Use the **same definition** on both sides (B1 always ends at the approver's "yes", not at payment).
- If a 2025 number can't be reconstructed, write **"not tracked"**.
- Round and anonymise anything that would identify a vendor, artist or sponsor.
