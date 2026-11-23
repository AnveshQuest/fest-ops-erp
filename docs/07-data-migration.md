# 07 · Data Migration

Milan 2025 had no system, so migration means turning its scattered sheets, chats and contact lists into clean masters, plus merch opening stock. In this rebuild the data is reconstructed from those sources and anonymised before import; the real values never leave your machine.

## 1. Sources

| Data | Likely source today | Owner |
|---|---|---|
| Vendors | Milan 2025 vendor sheet, dept heads' contacts, old quotations | Finance Head + dept heads |
| Artists / agencies | Pronites team's emails and contracts | Pronites head |
| Sponsors | Sponsorship tracker sheet, MoUs | Sponsorship head |
| Budget split | Approved budget sheet / meeting minutes | Overall Coordinators |
| Merch stock | Merch order and leftover count | Merch head |
| Transactions for testing | Typical 2025 purchases, artist bookings and sponsor deals, anonymised | Implementer |

## 2. Import order

Dependencies decide the order. Templates with the exact headers are in [`data/templates/`](../data/templates/); filled sample files are in [`data/sample/`](../data/sample/).

| # | DocType | File | Method |
|---|---|---|---|
| 1 | Supplier Group | `supplier_groups.csv` | Data Import (Insert) |
| 2 | Supplier | `suppliers.csv` | Data Import (Insert) |
| 3 | Customer Group | `customer_groups.csv` | Data Import (Insert) |
| 4 | Customer | `customers.csv` | Data Import (Insert) |
| 5 | Item Group | `item_groups.csv` | Data Import (Insert); set **Don't Import** on the two "(set manually)" columns, then set Item Defaults by hand |
| 6 | Item | `items.csv` | Data Import (Insert) |
| 7 | Opening stock | `opening_stock.csv` | Stock Reconciliation (Opening Stock purpose), paste rows |
| 8 | Budgets | `config/budgets.csv` | Enter by hand (16 rows) and submit |
| 9 | Test transactions | `data/sample/demo-transactions.md` | Entered by hand as each test user |

Always click **Download Template** for the doctype first and compare its headers with ours; if a label differs in your version, map the column in the import screen.

## 3. Cleaning rules

| Rule | Example | Why |
|---|---|---|
| One record per legal entity | Three spellings of the same sound vendor → one supplier | Duplicates split spending and payment history |
| Name = name on the invoice/PAN | Use the billing name, keep nicknames in the description | Bills must match the supplier |
| Every supplier has a group | Group from the list of 10 | Reporting by vendor type |
| No bank details in CSVs | Add bank accounts by hand in ERPNext, Finance role only | Sensitive data never sits in shared files |
| Phone numbers in +91 format | 98xxxxxxx → +91 98xxxxxxx | Consistent search |
| Item names say the unit | "Bus Hire (per day)" | Avoid quantity mistakes on POs |
| Sponsors keep the brand name, not the contact person | Contact person goes into Contact | One customer, many contacts |
| Anonymise before import | Real vendor name → "SoundLight Vendor 1"; amounts rounded | Real names and fees stay private |

## 4. Validation after each import

- Row count in ERPNext list = row count in the CSV.
- Spot-check 5 random records against the source.
- For items: open 3 items and confirm the expense/income account came from the item group.
- For opening stock: Stock Balance report quantity × rate = expected opening value (sample: ₹1,28,300).

## 5. Migration log

Record every import in the **Migration Log** sheet of the workbook.

| Date | DocType | Source file | Rows in file | Imported | Failed | Error | Fix applied | Re-run result |
|---|---|---|---|---|---|---|---|---|
| | Supplier | suppliers.csv | 16 | | | | | |
| | Customer | customers.csv | 8 | | | | | |
| | Item | items.csv | 28 | | | | | |
| | Opening stock | opening_stock.csv | 7 | | | | | |

Typical errors to expect and how to fix them:

| Error | Cause | Fix |
|---|---|---|
| "Could not find Supplier Group: …" | Group name typo or groups not imported yet | Fix spelling; import groups first |
| "Default Unit of Measure … not found" | UOM missing (e.g. "Square Foot" disabled) | Enable or create the UOM |
| Duplicate entry | Same name twice in the file | De-duplicate, re-run with Update Existing |
| Opening stock valuation 0 | Valuation Rate column empty | Fill rate from the merch invoice |
