# 06 · Configuration Runbook (ERPNext v16 on Frappe Cloud)

Follow the steps in order; later steps depend on earlier ones. Every list or form below can be opened by typing its name in the search bar (**Ctrl/Cmd + K**). Tick each step and note anything that differed from this runbook in the "Config notes" column of the workbook.

Files referenced live in [`config/`](../config/) and [`data/sample/`](../data/sample/).

---

## Step 0 · Create the site

1. Sign up at Frappe Cloud and start the **14-day trial** with **ERPNext** selected. Start it only when you can spend the next two weeks building, testing and recording the demo.
2. Choose a neutral subdomain like `fest-ops-demo.frappe.cloud`; the site holds only anonymised, reconstructed data.
3. Note the Administrator password in a password manager, never in this repo.
4. Turn on **two-factor authentication** for Administrator (System Settings).
5. Create one test user per role (Dept Head, Finance Head, Faculty, Coordinator, Merch) so the workflow and permissions can be tested end to end.
6. Before the trial ends, download a full backup so the site can be restored later (Frappe Cloud paid plan or a local Docker install) for interviews.

## Step 1 · Setup wizard

| Field | Value |
|---|---|
| Language / Country | English / India |
| Time zone | Asia/Kolkata |
| Currency | INR |
| Company name | Milan 2025 |
| Abbreviation | MLN |
| Financial year | The April–March year that contains Milan 2025 |
| Chart of accounts | Standard |

## Step 2 · Chart of accounts additions

Open **Chart of Accounts** and add the accounts in [`config/chart-of-accounts-additions.csv`](../config/chart-of-accounts-additions.csv):

- Group **Milan Event Expenses** under *Expenses*, with 11 ledger accounts (Artist Fees, Sound Light & Stage, Hospitality & Food, …).
- Group **Milan Income** under *Income*, with Institute Grant, Sponsorship Income, Merchandise Sales.

Budgets only work on ledger (non-group) accounts, which is why each expense type is its own account.

## Step 3 · Cost centers (departments)

Open **Cost Center** tree. Under `Milan 2025 - MLN`, create the 11 cost centers in [`config/cost-centers.csv`](../config/cost-centers.csv). All are ledger cost centers (not groups).

## Step 4 · Accounts settings

**Accounts Settings**
- Leave *Book Advance Payments in Separate Party Account* off for phase 1 (simpler for students).
- Check *Delete linked Payment Ledger entries* default — leave as is.

**Company** (`Milan 2025`)
- Default cost center: `Finance & Admin - MLN`
- Default expense account: `Admin & Miscellaneous - MLN`
- Default income account: `Sponsorship Income - MLN`

## Step 5 · Payment terms

Create two **Payment Terms Templates** from [`config/payment-terms.csv`](../config/payment-terms.csv):

| Template | Terms |
|---|---|
| Artist 50-50 | 50% due on contract date (0 days), 50% due on performance day (set due date on the PO) |
| Sponsor 50-50 | 50% within 7 days of invoice, 50% within 30 days |

## Step 6 · Masters (import)

Use **Data Import** (Import Type: *Insert New Records*) in this order. Details and cleaning rules: [`07-data-migration.md`](07-data-migration.md).

1. Supplier Group → 2. Supplier → 3. Customer Group → 4. Customer → 5. Item Group → 6. Item → 7. Warehouse (create **Merch Store - MLN** by hand)

After importing Item Groups, open each one and set **Item Defaults → Default Expense Account** (and Income Account for Sponsorship Packages and Merchandise) as listed in [`data/sample/item_groups.csv`](../data/sample/item_groups.csv). Items then inherit the right account automatically.

## Step 7 · Budgets

Open **Budget** → Add Budget, one per row of [`config/budgets.csv`](../config/budgets.csv) (16 rows, ₹40,00,000 total in the sample).

For each budget:
- Budget Against: **Cost Center**; choose the cost center and account.
- From / To Fiscal Year: the fest's fiscal year.
- Budget Amount from the CSV; Distribution Frequency **Yearly**.
- Control actions:
  - Applicable on Material Request → annual action **Warn**
  - Applicable on Purchase Order → annual action **Stop**
  - Applicable on booking actual expenses → annual action **Stop**
  - Monthly actions → **Ignore** (fest spending is lumpy)
- Submit.

Test immediately with UAT-02 and UAT-03.

## Step 8 · Roles and users

Create the custom roles and permissions in [`config/roles-and-permissions.md`](../config/roles-and-permissions.md):

- Roles: `Milan Dept Head`, `Milan Finance Head`, `Milan Faculty Advisor`, `Milan Coordinator`, `Milan Merch Counter`.
- Use **Role Profiles** so each user gets one profile.
- For each Dept Head, add a **User Permission** on *Cost Center* = their department (tick *Is Default*). They then see only their department's requests and POs.

## Step 9 · Custom fields

Add the fields in [`config/custom-fields.json`](../config/custom-fields.json) via **Customize Form** (or import the JSON through Data Import on *Custom Field*):

| DocType | Fields |
|---|---|
| Purchase Order | 3 Quotes Compared (Check), Quote Comparison (Attach) |
| Contract | Performance Date (Date), Performance Slot (Data), Rider Summary (Small Text) |
| Customer | Sponsorship Tier (Select: Title / Associate / Event / In-kind) |

## Step 10 · Approval workflow

Build **Workflow** "Milan PO Approval" on *Purchase Order* from [`config/workflow-purchase-order.json`](../config/workflow-purchase-order.json) (states, transitions and conditions are listed there in table form too).

- Create missing **Workflow State** records (Pending Finance Review, Pending Faculty Approval, Approved, Rejected) and **Workflow Action Master** records (Submit for Review, Approve, Escalate, Reject, Revise) first if the form asks.
- Untick **Allow Self Approval** on every approval transition.
- Turn on **Send Email Alert** so approvers get an email with action buttons.

## Step 11 · Contracts

- Create a **Contract Template** "Artist Performance Agreement" with the clauses Milan normally uses (fee, payment schedule, rider, cancellation). Use Jinja fields like `{{ start_date }}` for dates.
- Contracts are created with Party Type **Supplier** and linked to the artist's PO under References.

## Step 12 · Point of Sale

1. **Mode of Payment**: make sure *Cash* and *UPI* exist; map both to accounts for company Milan 2025.
2. **POS Profile** "Milan Merch Counter": warehouse *Merch Store - MLN*, cost center *Merchandise - MLN*, payment modes Cash and UPI, item group *Merchandise* only, allowed users = merch volunteers.
3. **Opening stock**: Stock Reconciliation into Merch Store with quantities and valuation rates from [`data/sample/opening_stock.csv`](../data/sample/opening_stock.csv).
4. Set **reorder levels** on merch items (Item → Inventory → Auto re-order).

## Step 13 · Custom report

Create **Report** "Milan Department Spend Tracker" from [`config/reports/department-spend-tracker.md`](../config/reports/department-spend-tracker.md):

- Report Type: **Query Report**, Ref DocType: *Budget*, Is Standard: **No**.
- Paste the SQL; add filters `company`, `from_date`, `to_date`.
- Give access to roles Milan Finance Head, Milan Coordinator, Milan Faculty Advisor.
- If query reports are blocked on the hosting plan, use the fallback in that file.

## Step 14 · Print formats and notifications

- **Letter Head** with Milan's logo for POs and sponsor invoices.
- **Notification**: email the sponsor contact 3 days before each payment term is due (Sales Invoice, Days Before due date).
- **Auto Email Report**: Department Spend Tracker to Finance Head and Coordinators every Monday.

## Step 15 · Backups and keeping the demo alive

- Download a full backup (database + files) once UAT passes and again after recording the demo.
- Note the site URL and trial end date in the README. After the trial, restore the backup to a paid shared plan or a local Docker install so the system can be shown live in interviews.
