# 04 · Process Maps (AS-IS and TO-BE)

AS-IS maps show how Milan 2025 actually ran, reconstructed from the implementer's experience as Head of Pronites; each is checked with a 2025 teammate (see `01-stakeholder-review.md`). Red-flag notes (⚠) mark where time or money was lost. TO-BE maps show the same process in ERPNext, with the doctype used at each step.

The diagrams are Mermaid and render on GitHub. To export as images, paste them into [mermaid.live](https://mermaid.live) or import into draw.io (Arrange → Insert → Advanced → Mermaid).

---

## P1 · Purchasing a service or item

### AS-IS (Milan 2025)
```mermaid
flowchart LR
    A[Dept member needs something] --> B[Messages Dept Head on WhatsApp]
    B --> C[Dept Head asks Finance on WhatsApp]
    C --> D{Finance checks budget sheet}
    D -- "sheet out of date ⚠" --> E[Guess or ask around]
    D --> F[Quotes collected as photos/PDFs ⚠]
    E --> F
    F --> G{Above faculty limit?}
    G -- yes --> H[Email to faculty-in-charge, wait days ⚠]
    G -- no --> I[Finance says OK on WhatsApp]
    H --> I
    I --> J[Vendor paid or student pays and claims ⚠]
    J --> K[Budget sheet updated, sometimes ⚠]
```

### TO-BE
```mermaid
flowchart LR
    A[Dept member raises Material Request] -->|budget check: Warn| B[Dept Head submits request]
    B --> C[Finance collects Supplier Quotations]
    C --> D[Purchase Order created from best quote]
    D -->|budget check: Stop| E[Workflow: Pending Finance Review]
    E --> F{Grand total above ₹1,00,000?}
    F -- yes --> G[Workflow: Pending Faculty Approval]
    F -- no --> H[Approved and submitted]
    G --> H
    H --> I[Purchase Invoice against PO]
    I --> J[Payment Entry with UTR reference]
    J --> K[Department Spend Tracker updates instantly]
```

---

## P2 · Booking an artist (Pronites)

### AS-IS (Milan 2025)
```mermaid
flowchart LR
    A[Shortlist artists with agencies] --> B[Negotiate fee on calls/email]
    B --> C[Coordinators + faculty approve over email]
    C --> D[Contract signed, PDF lives in an inbox ⚠]
    D --> E[Advance paid, noted in sheet ⚠]
    E --> F[Rider handled on WhatsApp ⚠]
    F --> G[Performance]
    G --> H[Balance paid, someone checks the email trail ⚠]
```

### TO-BE
```mermaid
flowchart LR
    A[Agency added as Supplier] --> B[PO for Artist Performance Fee, Pronites cost center]
    B --> C[PO approval workflow incl. faculty]
    C --> D[Contract record linked to PO: date, rider, signed copy]
    D --> E[Payment terms 50% advance / 50% on show day]
    E --> F[Advance Payment Entry against PO]
    F --> G[Performance]
    G --> H[Purchase Invoice + balance Payment Entry]
    H --> I[PO shows fully billed and paid]
```

---

## P3 · Sponsorship to cash

### AS-IS (Milan 2025)
```mermaid
flowchart LR
    A[Sponsor agrees on call/email] --> B[MoU emailed]
    B --> C[Amount noted in sponsor tracker sheet]
    C --> D[Fest happens]
    D --> E[After fest: check bank statement for payments ⚠]
    E --> F[Chase pending sponsors from memory ⚠]
```

### TO-BE
```mermaid
flowchart LR
    A[Sponsor added as Customer with tier] --> B[Sales Invoice with payment schedule]
    B --> C[Invoice emailed to sponsor from ERPNext]
    C --> D[Payment Entry when money arrives]
    D --> E[Accounts Receivable ageing shows pending amounts]
    E --> F[Weekly follow-up list from the report]
```

---

## P4 · Merchandise sales

### AS-IS (Milan 2025)
```mermaid
flowchart LR
    A[Merch delivered, counted once] --> B[Sold for cash/UPI]
    B --> C[Sale written in notebook ⚠]
    C --> D[Day end: cash counted, UPI checked on phone]
    D --> E[Mismatch found, cause unknown ⚠]
```

### TO-BE
```mermaid
flowchart LR
    A[Merch received via Purchase Receipt into Merch Store] --> B[POS Invoice per sale, Cash or UPI]
    B --> C[Stock drops automatically]
    C --> D[POS Closing Entry at day end]
    D --> E[Cash and UPI totals match POS; stock balance report]
```

---

## P5 · Budget monitoring and fest closing

### AS-IS (Milan 2025)
```mermaid
flowchart LR
    A[Budget split agreed in a meeting] --> B[Sheet shared with depts]
    B --> C[Spends added manually, late ⚠]
    C --> D[Overspend discovered after payment ⚠]
    D --> E[After fest: rebuild accounts from chats, bills, bank statement ⚠]
```

### TO-BE
```mermaid
flowchart LR
    A[Budgets entered per cost center and account] --> B[Every PO/invoice tagged to a cost center]
    B --> C[Department Spend Tracker: budget, committed, actual, available]
    C --> D[Budget Revision if coordinators approve extra funds]
    D --> E[After fest: P&L by cost center = final accounts]
```
