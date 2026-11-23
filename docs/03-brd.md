# 03 · Business Requirements Document (BRD)

| | |
|---|---|
| **Project** | Fest Ops ERP — retrospective rebuild of Milan 2025 |
| **Client (modelled)** | Milan 2025 organising team, IIT Hyderabad — not a live deployment |
| **Prepared by** | Anveshchandra Bavikadi |
| **Version** | 1.0 |
| **Status** | Items marked **[VERIFY]** are reconstructed from memory and should be checked with Milan 2025 teammates or records |

## 1. Background

Milan is IIT Hyderabad's annual inter-hostel General Championship across sports, cultural and technical events, run entirely by students with a faculty-in-charge. Over a few weeks the organising team buys services from dozens of vendors (sound, stage, catering, printing, transport, security, trophies), books artists for the pronites, raises sponsorship money and sells merchandise.

In Milan 2025 this ran on WhatsApp approvals, a shared budget spreadsheet, email threads for contracts and a sponsor tracker sheet, as seen first-hand by the implementer as Head of Pronites. The result was late visibility of overspending, approvals that were hard to trace, and sponsor money collected late. This BRD specifies the system Milan 2025 should have had.

## 2. Business objectives

| # | Objective | Measured by |
|---|---|---|
| O1 | No department overspends its approved budget without an explicit decision | Departments over budget at close (B3) |
| O2 | Every purchase has a traceable approval | % payments with an approval record (B4) |
| O3 | Faster approvals | Request-to-approval time (B1) |
| O4 | Real-time budget visibility | Time to answer "budget position of Dept X" (B2) |
| O5 | Collect sponsor money on time | Sponsor amount pending 30 days after the fest (B5) |
| O6 | Faster close | Days to final accounts after the fest (B8) |

## 3. Stakeholders and users

| Role | Count in 2025 **[VERIFY]** | Would use the system to |
|---|---|---|
| Overall Coordinators | 2 | View all budgets, approve budget revisions |
| Finance Head / Treasurer | 1–2 | Own the system; approve POs; record invoices and payments; run reports |
| Department Heads | ~10 | Raise and approve their department's requests; watch their budget |
| Department members | 20–40 | Raise purchase requests (optional; heads may do it for them) |
| Pronites / Artist Relations | 2 | Record artist contracts |
| Sponsorship team | 3–5 | Maintain sponsors; raise sponsor invoices |
| Merch counter volunteers | 4–6 | Sell merchandise via POS |
| Faculty-in-charge | 1 | Approve purchases above ₹1,00,000 |

## 4. Organisation structure in the system

**Company:** Milan 2025 (abbreviation `MLN`), currency INR, the April–March financial year containing the fest.

**Departments (Cost Centers):** Pronites, Sports, Cultural, Technical, Hospitality, Production & Logistics, Marketing & Design, Security, Finance & Admin, Merchandise, Contingency.

**Funding sources:** Institute / Gymkhana grant, sponsorships (cash and in-kind), merchandise sales **[VERIFY]**.

## 5. Current process summary (AS-IS, Milan 2025)

Detailed maps in [`04-process-maps.md`](04-process-maps.md).

1. A department member asked the department head on WhatsApp; the head asked Finance.
2. Finance checked the budget sheet (often out of date) and replied.
3. Quotations were collected as PDFs or photos; large spends were forwarded to the faculty-in-charge by email.
4. The vendor was paid by the institute / Gymkhana account, or a student paid and claimed later.
5. The budget sheet was updated when someone remembered.
6. Sponsor MoUs were emailed; payments were checked against the bank statement after the fest.
7. Merch was sold for cash/UPI and tallied by hand.

## 6. Functional requirements

Priority: **M** = must have, **S** = should have, **C** = could have.

### 6.1 Budget control
| ID | Requirement | Priority |
|---|---|---|
| FR-01 | Each department has an approved budget, split by expense type | M |
| FR-02 | A purchase order that would exceed the department's budget is blocked; a purchase request that would exceed it shows a warning | M |
| FR-03 | Finance Head can see budget, committed (open POs), actual and available money for every department on one screen | M |
| FR-04 | Budget changes are approved by the Overall Coordinators and keep a history | S |

### 6.2 Purchasing and approvals
| ID | Requirement | Priority |
|---|---|---|
| FR-05 | A department member can raise a purchase request with item, quantity, estimated rate, required-by date and department | M |
| FR-06 | Purchases above ₹50,000 need three quotations attached before approval **[VERIFY threshold]** | M |
| FR-07 | Approval chain: Department Head → Finance Head; above ₹1,00,000 also Faculty-in-charge **[VERIFY threshold]** | M |
| FR-08 | Nobody can approve their own request | M |
| FR-09 | One vendor master with contact, PAN/GSTIN and payment details; bank details visible to Finance only | M |
| FR-10 | Vendor bills are recorded against the PO and payments against the bill, with UTR/cheque reference | M |
| FR-11 | Finance can see what is owed to each vendor and when it is due | M |

### 6.3 Artist management
| ID | Requirement | Priority |
|---|---|---|
| FR-12 | Each artist booking has a contract record: performance date, fee, payment terms, rider summary, signed copy attached | M |
| FR-13 | Advance and balance payments are tracked against the booking per its payment terms | M |
| FR-14 | TDS on artist and professional fees is applied where required **[VERIFY with 2025 Finance Head]** | S |

### 6.4 Sponsorship
| ID | Requirement | Priority |
|---|---|---|
| FR-15 | Sponsor master with tier (Title, Associate, Event, In-kind) and contact person | M |
| FR-16 | An invoice is raised for each cash sponsor with a payment schedule | M |
| FR-17 | Pending sponsor amounts and their age are visible at any time | M |
| FR-18 | In-kind sponsorships are recorded at agreed value | S |
| FR-19 | GST is charged on sponsorship invoices if applicable **[VERIFY]** | S |

### 6.5 Merchandise
| ID | Requirement | Priority |
|---|---|---|
| FR-20 | Merch stock is tracked by item and size, starting from an opening count | M |
| FR-21 | The merch counter sells through POS with Cash and UPI, with a day-end closing | M |
| FR-22 | Low stock of a merch item is flagged | C |

### 6.6 Reimbursements
| ID | Requirement | Priority |
|---|---|---|
| FR-23 | A student's out-of-pocket spend is reimbursed against an approved request with the bill attached | S |

### 6.7 Reporting, access and audit
| ID | Requirement | Priority |
|---|---|---|
| FR-24 | Final fest accounts show income and expense by department | M |
| FR-25 | Departments see only their own documents; artist fees visible only to Pronites head, Finance and Coordinators | M |
| FR-26 | Every approval records who, what and when | M |

## 7. Non-functional requirements

| ID | Requirement |
|---|---|
| NFR-01 | Raising a purchase request takes under 5 minutes, including on a phone |
| NFR-02 | Each role can be trained in 30 minutes or less |
| NFR-03 | Data stays in the client's ERPNext site; daily backups (Frappe Cloud default) |
| NFR-04 | Only anonymised material leaves the system for the implementer's portfolio |
| NFR-05 | A non-technical successor can run the system using the SOPs |

## 8. Assumptions and constraints

- Milan's money is held and paid through an institute / Gymkhana account; ERPNext records the transactions, it does not move money. **[VERIFY]**
- GST registration and TDS obligations belong to the institute; ERPNext is configured to match whatever the institute's accounts section confirms.
- Hosting: Frappe Cloud 14-day trial, then a paid shared plan or a self-hosted backup restore.
- This is a rebuild on reconstructed, anonymised data; it was not used by the 2025 team. A rollout plan for a future team is in `10-rollout-plan.md`.

## 9. Decision log

| # | Date | Decision | Decided by | Reason |
|---|---|---|---|---|
| D1 | | Budgets controlled at Purchase Order stage with **Stop**; Material Request with **Warn** | | Block commitments, not ideas |
| D2 | | Student reimbursements via Purchase Invoice to a "Student Reimbursements" supplier in phase 1 (Expense Claim needs the Frappe HR app) | | Avoid installing HR for one feature |
| D3 | | Faculty approval threshold ₹1,00,000; three quotes above ₹50,000 | | [VERIFY] |
| D4 | | | | |

## 10. Review

| Reviewer | Role in Milan 2025 | Reviewed (AS-IS / demo) | Date |
|---|---|---|---|
| | Finance Head | | |
| | Overall Coordinator | | |
