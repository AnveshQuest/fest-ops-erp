# 05 · Fit-Gap Analysis

Each requirement from the [BRD](03-brd.md) is classified as:

- **Standard** — works out of the box in ERPNext v16
- **Config** — works after setup (masters, settings, permissions, workflow, custom fields)
- **Custom** — needs something built (report, script) inside ERPNext
- **Workaround** — not natively supported in core ERPNext; handled a different way
- **Confirm** — depends on an answer from the client or institute

| ID | Requirement | Fit | ERPNext solution | Effort | Notes |
|---|---|---|---|---|---|
| FR-01 | Budget per department, by expense type | Config | Cost Center per department; one Budget per cost center + expense account | Low | Budgets can't use group accounts, so define the key expense accounts per department |
| FR-02 | Block POs over budget, warn on requests | Config | Budget control actions: Purchase Order = Stop, Material Request = Warn, Actual = Stop | Low | PO control needs "actual expenses" turned on too |
| FR-03 | Budget, committed, actual, available on one screen | Custom | Query report "Department Spend Tracker" (SQL in `config/reports/`) | Medium | Standard Budget Variance Report shows budget vs actual but not open POs |
| FR-04 | Approved budget changes with history | Config | Budget Revision + version history; Coordinators hold the role | Low | |
| FR-05 | Purchase request with department | Standard | Material Request (Purchase); cost center on item rows, defaulted per user | Low | Set default cost center through User Permission |
| FR-06 | 3 quotes above ₹50,000 | Config | Supplier Quotation; custom fields "3 Quotes Compared" + attachment on PO; workflow condition blocks review without it | Low | Threshold to confirm |
| FR-07 | Dept Head → Finance → Faculty above ₹1,00,000 | Config | Workflow "Milan PO Approval" on Purchase Order with amount-based condition | Medium | See `config/workflow-purchase-order.json` |
| FR-08 | No self-approval | Config | "Allow Self Approval" unchecked on approval transitions | Low | |
| FR-09 | Single vendor master; bank details restricted | Config | Supplier + Supplier Group; Bank Account doctype readable by Finance role only | Low | |
| FR-10 | Bills against PO, payments against bills | Standard | Purchase Invoice from PO; Payment Entry with reference no. and date | — | |
| FR-11 | What we owe and when | Standard | Accounts Payable report, Purchase Order Analysis | — | |
| FR-12 | Artist contract record | Config | Contract doctype (party = Supplier), linked to PO; custom fields for performance date, slot, rider summary | Low | |
| FR-13 | Advance and balance tracking | Standard | Payment Terms Template "Artist 50-50" on PO; advance Payment Entry against PO | Low | |
| FR-14 | TDS on artist fees | Confirm | Tax Withholding Category (194J / 194C) on Supplier | Low | Only if the institute deducts TDS through this entity |
| FR-15 | Sponsor master with tier | Config | Customer Group "Sponsors"; custom field "Sponsorship Tier" on Customer | Low | |
| FR-16 | Sponsor invoice with schedule | Standard | Sales Invoice with Payment Terms Template "Sponsor 50-50" | — | |
| FR-17 | Pending sponsor amounts and age | Standard | Accounts Receivable report (ageing buckets) | — | |
| FR-18 | In-kind sponsorships at value | Workaround | Sales Invoice for the agreed value settled by a Journal Entry against an "In-kind Sponsorship" expense account | Low | Agree accounting treatment with Finance |
| FR-19 | GST on sponsorship | Confirm | India Compliance app + Sales Taxes template | Medium | Depends on whose GSTIN invoices |
| FR-20 | Merch stock by item and size | Standard | Stock items per size; opening stock via Stock Reconciliation | Low | |
| FR-21 | POS with Cash and UPI, day-end closing | Config | POS Profile "Milan Merch Counter", modes Cash + UPI; POS Opening/Closing Entry | Low | |
| FR-22 | Low-stock flag | Config | Reorder level per item + Stock Projected Qty report | Low | |
| FR-23 | Student reimbursements | Workaround | Purchase Invoice to supplier "Student Reimbursements" with student name + bill attached; Expense Claim would need the Frappe HR app | Low | Revisit if volume is high |
| FR-24 | Final accounts by department | Standard | Profit and Loss Statement filtered/grouped by cost center | — | |
| FR-25 | Department-level and field-level access | Config | Roles + User Permission on Cost Center; perm level 1 on contract fee fields | Medium | Test with UAT-18 |
| FR-26 | Audit trail of approvals | Standard | Workflow Action log + document version history | — | |

## Summary

| Fit | Count | Share |
|---|---|---|
| Standard | 9 | 34.6% |
| Config | 12 | 46.2% |
| Custom | 1 | 3.8% |
| Workaround | 2 | 7.7% |
| Confirm | 2 | 7.7% |
| **Total** | **26** | **100%** |

**21 of 26 requirements (81%) are met by standard features or configuration.** One small custom report, two documented workarounds and two items awaiting the institute's answer cover the rest. No custom app is needed, so the whole setup runs on a standard Frappe Cloud site.

## Out of scope

| Need raised | Why out of scope | Suggested alternative |
|---|---|---|
| Event schedule, fixtures, points table | Not an ERP process | Existing Milan website / sheet |
| Volunteer attendance and certificates | Needs HR module; low value for this phase | Google Form |
| Ticketing / registrations | Milan is an internal championship | — |
