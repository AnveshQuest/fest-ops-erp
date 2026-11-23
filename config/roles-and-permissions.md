# Roles and Permissions

## Custom roles

| Role | Given to | Purpose |
|---|---|---|
| Milan Dept Head | Department heads | Raise requests and draft POs for their own department; see own budget |
| Milan Finance Head | Finance Head / Treasurer | Own the system; review/approve POs; invoices, payments, reports |
| Milan Faculty Advisor | Faculty-in-charge | Approve POs above ₹1,00,000 |
| Milan Coordinator | Overall Coordinators | View everything; approve budget revisions; release Contingency |
| Milan Merch Counter | Merch volunteers | POS only |

Standard ERPNext roles are added on top through **Role Profiles**:

| Role Profile | Roles |
|---|---|
| Milan – Dept Head | Milan Dept Head, Purchase User, Stock User (read) |
| Milan – Finance Head | Milan Finance Head, Accounts Manager, Purchase Manager, Sales User, Stock Manager |
| Milan – Faculty | Milan Faculty Advisor, Accounts User (read) |
| Milan – Coordinator | Milan Coordinator, Accounts User (read), Purchase User (read) |
| Milan – Merch | Milan Merch Counter, Sales User (POS only), Stock User |
| Milan – Sponsorship | Sales User |
| Milan – Pronites | Milan Dept Head, Purchase User, contract access (perm level 1) |

## Document permissions (Role Permissions Manager)

| DocType | Dept Head | Finance Head | Faculty | Coordinator | Merch |
|---|---|---|---|---|---|
| Material Request | Create, Read, Write, Submit (own dept) | All | Read | Read | — |
| Supplier Quotation | Create, Read (own dept) | All | Read | Read | — |
| Purchase Order | Create, Read, Write (own dept) | All | Read (+ workflow approve) | Read | — |
| Purchase Invoice | Read (own dept) | All | Read | Read | — |
| Payment Entry | — | All | Read | Read | — |
| Contract | Pronites only | All | Read | Read | — |
| Sales Invoice | — | All | Read | Read | — |
| Budget / Budget Revision | Read (own dept) | All | Read | Read, Write | — |
| Bank Account | — | Read, Write | — | — | — |
| POS Invoice | — | All | — | Read | Create, Read, Submit |

## Department-level restriction

For each Dept Head user, add **User Permission**: Allow = *Cost Center*, For Value = their department, *Is Default* ticked, *Apply To All Document Types* ticked. Records tagged to other cost centers then stay hidden from them, and new documents default to their department.

## Field-level restriction (artist fees)

Artist fees appear in two places:

- **Purchase Orders** for artists carry the *Pronites* cost center, so the cost-center User Permission above already hides them from every other department head. (Perm levels work per field, not per row, so they can't hide only the artist rows on POs.)
- **Contract**: set **perm level 1** on the contract terms and the custom rider field in Customize Form, and grant level-1 read only to Finance Head, Coordinators, Faculty and the Pronites head.

Verify both with UAT-18.

## Self-approval

Every approval transition in the workflow has *Allow Self Approval* unticked. If the Finance Head also heads Finance & Admin and drafts a PO, a second user with the Finance Head role (e.g. the Treasurer) must approve it. Give the role to two people for this reason.
