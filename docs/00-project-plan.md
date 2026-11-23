# 00 · Project Plan

## 1. Objective

Rebuild the operations of Milan 2025 (held in October 2025) — budgets, purchasing, artist contracts, sponsorships and merchandise — in ERPNext v16, so that every rupee of fest spending is requested, approved, committed, paid and reported in one system. Show it working end to end on a live ERPNext site with reconstructed data, and document it the way an implementation consultant would for a real client.

**Honest framing:** Milan 2025 ran on WhatsApp, sheets and email. This project is a retrospective rebuild by its Head of Pronites; it was not deployed to the 2025 organising team.

## 2. Scope

**In scope**

| Area | Modules / doctypes |
|---|---|
| Budget control | Cost Center, Budget, Budget Variance Report |
| Procurement | Material Request, Supplier Quotation, Purchase Order, Purchase Invoice, Payment Entry |
| Approvals | Workflow on Purchase Order (3 levels) |
| Artist management | Contract, Payment Terms Template, advance Payment Entry |
| Sponsorship | Customer, Sales Invoice, Payment Entry, Accounts Receivable |
| Merchandise | Item, Warehouse, Stock Reconciliation, POS Profile, POS Invoice |
| Reporting | Department Spend Tracker (custom query report), standard AR/AP reports |

**Out of scope**

- Deploying to a live fest team (a rollout plan for a future team is included instead)
- Payroll, HR and attendance of volunteers
- Ticketing / registrations (Milan is an internal inter-hostel championship)
- Statutory GST filing

## 3. Phases (about 3 weeks, part-time)

| Phase | Week | Key outputs |
|---|---|---|
| 1 · Reconstruct the 2025 current state | 1 | Own records and recall, 2–3 conversations with 2025 teammates, AS-IS maps, reconstructed baseline |
| 2 · Design | 1 | BRD, TO-BE maps, fit-gap |
| 3 · Configuration & migration | 2 | Frappe Cloud site; company, CoA, cost centers, budgets; workflow; custom fields; custom report; reconstructed masters imported |
| 4 · Testing | 2–3 | 20 UAT cases run with test users per role; issue log |
| 5 · Review | 3 | Walkthrough with 1–2 Milan 2025 teammates; their feedback logged |
| 6 · Package | 3 | Measured comparison, 3-minute demo video, case-study site, rollout plan, resume bullets |

> The Frappe Cloud trial is **14 days**: start it at Phase 3 and download a backup before it ends.

## 4. Who is involved

| Person | Role in the rebuild |
|---|---|
| Anvesh (Head of Pronites, Milan 2025) | Implementer: everything below unless stated |
| 1–2 Milan 2025 core members (e.g. Finance Head, a Coordinator) | Confirm the AS-IS maps and the reconstructed numbers; review the demo; optional quote |
| Test users in ERPNext | One per role, used by the implementer to test workflow and permissions |

Ask teammates before using anything they share, and anonymise all names and amounts.

## 5. Risks

| Risk | Impact | Mitigation |
|---|---|---|
| 2025 numbers are remembered, not recorded | Weak baseline | Label every baseline "reconstructed", give the source (own records, teammate, estimate) |
| Looks like a live deployment when it isn't | Credibility lost in interviews | Say "rebuild" everywhere: README, site, resume, video |
| Trial expires before the demo is recorded | No live system to show | Record the video and download a backup in week 3 |
| Sensitive 2025 data (artist fees, sponsor amounts) leaks | Breach of teammates' trust | Repo holds anonymised sample data only |

## 6. Definition of done

- [ ] AS-IS maps checked by at least one Milan 2025 teammate
- [ ] Budgets for every department load and block an over-budget PO
- [ ] All 20 UAT cases run and recorded
- [ ] Demo video recorded on the live site
- [ ] Metrics table filled with labelled sources
- [ ] Backup downloaded; case-study site live
