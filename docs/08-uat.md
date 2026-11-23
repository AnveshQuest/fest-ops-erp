# 08 · User Acceptance Testing (UAT)

Run on the configured site by the implementer, logged in as the test user for each role, using the sample transactions in [`data/sample/demo-transactions.md`](../data/sample/demo-transactions.md). The "Role" column is the user the case is run as. Record results in the **UAT** sheet of the workbook; the demo is recorded only after every **M** (must) case passes.

| ID | Req | Scenario | Steps | Expected result | Role | Priority |
|---|---|---|---|---|---|---|
| UAT-01 | FR-01 | Budgets loaded | Open Budget list; filter company Milan 2025 | 16 submitted budgets totalling ₹40,00,000 | Finance Head | M |
| UAT-02 | FR-02 | PO over budget is blocked | Enter T1, T2, T4 (approved), then T5 and approve | T5 cannot be submitted; message says Artist Fees budget exceeded | Finance Head | M |
| UAT-03 | FR-02 | Request over budget warns | Material Request for 1 × ART-FEE @ ₹1,00,000 in Pronites after T1–T4 | Warning shown; request can still be saved | Dept Head | M |
| UAT-04 | FR-05 | Dept head raises request on phone | Log in as the Pronites head test user on a phone; create Material Request | Cost center defaults to Pronites; done in under 5 minutes | Dept Head | M |
| UAT-05 | FR-06 | Three quotes enforced | Draft T6 (₹2,16,000) without ticking "3 Quotes Compared" | "Submit for Review" not available until ticked and comparison attached | Dept Head | M |
| UAT-06 | FR-07 | Small PO approved by Finance only | Enter T7 (₹11,200), submit for review, approve as Finance Head | State goes Draft → Pending Finance Review → Approved; PO submitted | Finance Head | M |
| UAT-07 | FR-07 | Large PO escalates to Faculty | Enter T6, submit for review | Finance Head sees only "Escalate" and "Reject", not "Approve" | Finance Head | M |
| UAT-08 | FR-07 | Faculty approves from email | Faculty clicks Approve in the workflow email for T6 | PO approved; action logged with faculty user and time | Faculty | M |
| UAT-09 | FR-08 | No self-approval | Finance Head, who is also head of Finance & Admin (both roles), drafts a PO, submits it for review and tries to approve it | Approve action not available to the PO's creator; a second user with the Finance Head role must approve | Finance Head | M |
| UAT-10 | FR-07 | Reject and revise | Reject T8 with a comment; dept head revises and resubmits | State Rejected → Draft → Pending Finance Review; comment visible | Dept Head | S |
| UAT-11 | FR-10 | Bill against PO, pay with reference | Purchase Invoice from T7; Payment Entry with UTR no. | PO 100% billed; invoice Paid; UTR stored | Finance Head | M |
| UAT-12 | FR-12 | Artist contract linked to PO | Create Contract for Agency B (party type Supplier), performance date, rider, attach signed copy, reference T2 | Contract shows Active after Signed is ticked; visible from the PO's connections | Pronites Head | M |
| UAT-13 | FR-13 | Artist advance against PO | T3: Payment Entry ₹3,00,000 against T2 | PO shows advance paid ₹3,00,000; Accounts Payable shows no overdue | Finance Head | M |
| UAT-14 | FR-16 | Sponsor invoice with schedule | T10 with Sponsor 50-50 | Payment schedule has two rows of ₹2,50,000 at +7 and +30 days | Sponsorship Head | M |
| UAT-15 | FR-17 | Receivables ageing | After T11 and T12, open Accounts Receivable | Title sponsor ₹2,50,000 and EdTech ₹2,00,000 outstanding, in the right age bucket | Finance Head | M |
| UAT-16 | FR-21 | POS sale with UPI and cash | T13 and T14 at the merch counter | Invoices created; stock MER-TEE-M 118, MER-HOOD-L 39 | Merch volunteer | M |
| UAT-17 | FR-21 | POS day close | T15 POS Closing Entry | Cash ₹899, UPI ₹847; no difference | Merch Head | M |
| UAT-18 | FR-25 | Department and field-level access | Log in as Sports head | Sees only Sports documents; cannot see artist fee amounts | Finance Head | M |
| UAT-19 | FR-03 | Spend tracker correct | Run Department Spend Tracker after T1–T15 | Matches the expected table in demo-transactions.md (Total committed ₹13,82,000, actual ₹13,050) | Finance Head | M |
| UAT-20 | FR-24 | Final accounts by department | Profit and Loss, filtered by cost center Marketing & Design | Expense ₹11,200 | Finance Head | S |

## Result summary (fill in)

| Run | Date | Passed | Failed | Blocked | Notes |
|---|---|---|---|---|---|
| 1 | | | | | |
| 2 (retest) | | | | | |
