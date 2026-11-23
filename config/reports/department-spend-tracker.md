# Custom report: Milan Department Spend Tracker

**Why it's needed (FR-03):** the standard *Budget Variance Report* compares budget with actual expense, but money already committed through approved, unbilled purchase orders doesn't show up until the vendor bill is booked. In a fest, most money is committed weeks before bills arrive, so "available" must subtract commitments too.

| Column | Meaning |
|---|---|
| Department | Cost center |
| Budget | Sum of submitted budgets for the cost center |
| Committed | Approved PO value not yet billed |
| Actual | Posted expense on budgeted accounts (bills, journal entries, reimbursements) |
| Available | Budget − Committed − Actual |
| Used % | (Committed + Actual) ÷ Budget |

## Setup

1. Search **Report** → New.
2. Report Name: `Milan Department Spend Tracker` · Report Type: **Query Report** · Ref DocType: **Budget** · Is Standard: **No**.
3. Paste the SQL from [`department-spend-tracker.sql`](department-spend-tracker.sql) into *Query*.
4. Add filters: `company` (Link → Company, mandatory), `from_date` (Date), `to_date` (Date).
5. Roles: Milan Finance Head, Milan Coordinator, Milan Faculty Advisor, System Manager.
6. Save, open the report, and check the totals against UAT-19.

## Version note

ERPNext v16's Budget holds **one account per budget** (`account`, `budget_amount` on the Budget itself). If the site runs v15, budgets keep accounts in the child table `tabBudget Account`; use the v15 variant at the bottom of the SQL file. Check the field names in your instance with **Customize Form → Budget** before saving.

## Fallback if query reports are not allowed on the plan

Use the standard **Budget Variance Report** (budget vs actual) together with **Purchase Order Analysis** filtered to *To Bill* and grouped by cost center (commitments). Export both to the workbook's *Budget Tracker* sheet, which does the Available and Used % arithmetic.
