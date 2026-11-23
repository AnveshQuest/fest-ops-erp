# 13 · Resume Bullets and Interview Stories

## Resume bullets

Every bullet says "rebuilt" — Milan 2025 did not run on ERPNext, and interviewers for implementation roles will ask about users and go-live. Each bullet is about one line long so no word sits alone on a last line; check in the placement portal's preview, since line width differs.

### Version A — use once the site is configured and UAT is run

- Rebuilt Milan 2025's fest finance operations in ERPNext v16, drawing on my role as its Head of Pronites
- Mapped 26 requirements and a fit-gap; set up budgets for 10 departments and a 3-level PO approval workflow
- Configured artist contracts with 50/50 advance terms, sponsor invoicing with ageing, and merchandise POS

### Version B — swap in the third bullet once the comparison is measured

- Wrote a custom SQL spend tracker and 20 UAT cases; a budget check took [X] in 2025, under [Y] in the rebuild

Fill [X] and [Y] only from [`11-metrics.md`](11-metrics.md) and re-check the line length after filling.

### One-line project title (projects section)

**Fest Ops ERP — retrospective ERPNext rebuild of Milan 2025, IIT Hyderabad** · github.com/AnveshQuest/fest-ops-erp

## How to describe it in an interview (30 seconds)

"I was Head of Pronites for Milan 2025, IIT Hyderabad's inter-hostel championship, and handled artist bookings and our budget. Approvals lived in WhatsApp and nobody knew what a department could still spend. Afterwards I rebuilt the fest's operations in ERPNext as an implementation exercise: reconstructed the current state, wrote requirements and a fit-gap, configured and tested it on a live site with anonymised data, and wrote the rollout plan a future team would follow."

## Interview stories (STAR)

**1. A requirement ERPNext couldn't meet out of the box**
*Situation:* In 2025 the real question was "how much can this department still spend?" ERPNext's Budget Variance Report ignores approved-but-unbilled POs, and fest money is mostly committed weeks before bills arrive.
*Action:* Wrote a query report joining Budget, open PO items and GL entries to show budget, committed, actual and available per cost center; kept a no-code fallback (two standard reports + a sheet) in case query reports are blocked on the hosting plan.
*Result:* One screen answers the question; [measured time in the rebuild] vs [2025, reconstructed].

**2. Expense claims without installing an HR module**
*Situation:* Students paid out of pocket in 2025 and claimed later. ERPNext's Expense Claim now lives in the separate Frappe HR app.
*Action:* Weighed installing HR (employees, departments, approvers — heavy for 40 student volunteers) against a Purchase Invoice to a "Student Reimbursements" supplier with the bill attached; chose the workaround and logged the decision.
*Result:* Reimbursements are budget-checked and show in the tracker with no extra modules.

**3. Artist payments (from your own Pronites work)**
*Situation:* [What actually happened with an artist advance, contract or rider in 2025.]
*Action:* Modelled the booking as a PO with 50/50 payment terms and a linked Contract holding performance date, rider and signed copy.
*Result:* The advance, the balance due date and the contract sit on one record.

**4. Messy data** *(fill from the migration log)*
e.g. the same sound vendor under three spellings across sheets; de-duplicated by billing name and anonymised before import.

**5. What a real rollout would need** *(from the rollout plan and teammates' feedback)*
Finance Head as champion; dept heads learn two screens; "not in ERPNext, not approved" rule; a 3-day parallel run.

**If asked "did Milan use it?"** — "No. It's a rebuild of the 2025 process I worked in. I've written the rollout plan a team would follow, and the hardest part of a real go-live would be adoption, which is why the plan starts with the Finance Head as champion."

## How this maps to an implementation specialist's job (e.g. Prentis.ai)

| Their phase | What I did here | Evidence in repo |
|---|---|---|
| Discovery | Reconstructed the 2025 current state; recall interviews; baseline with sources | `docs/02`, `docs/04` |
| Solution design | BRD, fit-gap, TO-BE maps | `docs/03`, `docs/05` |
| Configuration | CoA, cost centers, budgets, workflow, roles, custom fields, POS | `docs/06`, `config/` |
| Data migration | Templates, cleaning and anonymisation rules, import order, log | `docs/07`, `data/` |
| UAT | 20 cases traced to requirements, run per role | `docs/08` |
| Training | Role-based SOPs | `docs/09-training-sops/` |
| Go-live & support | Proposed cutover, parallel run, hypercare, issue log | `docs/10` |
| Value | 2025 vs rebuild comparison | `docs/11` |
