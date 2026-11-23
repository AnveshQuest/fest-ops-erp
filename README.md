# Fest Ops ERP — rebuilding Milan 2025's operations in ERPNext

A retrospective ERP implementation. As **Head of Pronites for Milan 2025** (October 2025), IIT Hyderabad's inter-hostel General Championship, I handled artist outreach and the event budget, and saw how the fest's money actually moved. This project rebuilds those operations in **ERPNext v16** — department budgets, purchase approvals, artist contracts, sponsor receivables and merchandise — to show how Milan should have run.

> **What this is, and isn't:** Milan 2025 did not run on ERPNext. This is a rebuild: the current-state analysis comes from my own Milan 2025 experience, the system is configured and tested on a live ERPNext site, and all data is **reconstructed and anonymised**. Real vendor, artist, sponsor and budget figures are never committed here.

**Platform:** ERPNext v16 on Frappe Cloud · **Method:** reconstruct the AS-IS → requirements → fit-gap → configuration → data migration → UAT → rollout plan → measure on the demo system

---

## What I saw in Milan 2025

A fest like Milan moves lakhs of rupees in a few weeks through 10+ student-run departments. In 2025:

- purchase requests and approvals lived in WhatsApp threads and email,
- the budget sheet was out of date the moment a vendor was paid,
- artist contracts and advances were tracked in inboxes — including mine, as Head of Pronites,
- sponsor payments were chased from memory after the fest,
- merchandise was sold for cash/UPI with a manual tally.

The question nobody could answer quickly: "how much can Pronites still spend, counting what we've already promised vendors?"

## The rebuild (ERPNext, configured — not coded)

| Fest need | ERPNext feature used |
|---|---|
| Departments with their own budgets | **Cost Centers** + **Budget** (Stop/Warn on Material Request, Purchase Order and actual expense) |
| Purchase requests and spending approvals | **Material Request** → **Supplier Quotation** → **Purchase Order** with a 3-level **Workflow** (Dept Head → Finance Head → Faculty-in-charge above ₹1,00,000) |
| Vendors | **Supplier** master with Supplier Groups |
| Artist contracts and advances | **Contract** (linked to the PO) + **Payment Terms Template** (50% advance / 50% on performance) |
| Sponsorship receivables | **Customer** (sponsor) + **Sales Invoice** + **Payment Entry** + Accounts Receivable ageing |
| Merchandise | **Stock** + **POS** (Cash/UPI) |
| Budget vs actual by department | **Budget Variance Report** + custom **Department Spend Tracker** (budget, committed, actual, available) |

## Repo map

| Folder / file | What's inside |
|---|---|
| [`docs/00-project-plan.md`](docs/00-project-plan.md) | Phases, timeline, scope, risks |
| [`docs/01-stakeholder-review.md`](docs/01-stakeholder-review.md) | How the rebuild is validated with Milan 2025 teammates |
| [`docs/02-reconstruction-guide.md`](docs/02-reconstruction-guide.md) | Rebuilding the 2025 current state: sources, recall interviews, baseline |
| [`docs/03-brd.md`](docs/03-brd.md) | Business Requirements Document |
| [`docs/04-process-maps.md`](docs/04-process-maps.md) | AS-IS (Milan 2025) and TO-BE process maps |
| [`docs/05-fit-gap.md`](docs/05-fit-gap.md) | Requirement-by-requirement fit-gap analysis |
| [`docs/06-configuration-runbook.md`](docs/06-configuration-runbook.md) | Step-by-step ERPNext v16 setup on Frappe Cloud |
| [`docs/07-data-migration.md`](docs/07-data-migration.md) | Cleaning rules, import order, migration log |
| [`docs/08-uat.md`](docs/08-uat.md) | 20 UAT cases |
| [`docs/09-training-sops/`](docs/09-training-sops/) | One-page SOP per user task |
| [`docs/10-rollout-plan.md`](docs/10-rollout-plan.md) | Proposed go-live and hypercare plan for a future Milan team |
| [`docs/11-metrics.md`](docs/11-metrics.md) | Milan 2025 (reconstructed) vs the rebuild (measured on the demo system) |
| [`docs/12-demo-video-script.md`](docs/12-demo-video-script.md) | 3-minute demo script |
| [`docs/13-resume-and-interview.md`](docs/13-resume-and-interview.md) | Resume bullets and interview stories |
| [`config/`](config/) | Chart of accounts additions, cost centers, budgets, roles, workflow, custom fields, payment terms, custom report SQL |
| [`data/sample/`](data/sample/) | Reconstructed, anonymised masters in ERPNext Data Import format |
| [`data/templates/`](data/templates/) | Empty import templates |
| [`workbooks/Fest-Ops-ERP-Workbook.xlsx`](workbooks/) | Fit-gap, UAT, migration log, issue log, metrics, budget tracker |
| [`site/`](site/) | Case-study website |

## Results

Measured on the demo system against the reconstructed 2025 process, as described in [`docs/11-metrics.md`](docs/11-metrics.md). Every figure says which side it comes from; none is presented as a result from a live fest.

---

Built by **Anveshchandra Bavikadi** (B.Tech, IIT Hyderabad) · Head of Pronites, Milan 2025
