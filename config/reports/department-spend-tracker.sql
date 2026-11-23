-- Milan Department Spend Tracker (ERPNext v16, Query Report)
-- Filters: %(company)s, %(from_date)s, %(to_date)s

SELECT
    t.cost_center                                   AS "Department:Link/Cost Center:220",
    t.budget                                        AS "Budget:Currency:130",
    t.committed                                     AS "Committed:Currency:130",
    t.actual                                        AS "Actual:Currency:130",
    t.budget - t.committed - t.actual               AS "Available:Currency:130",
    ROUND(100 * (t.committed + t.actual) / NULLIF(t.budget, 0), 1)
                                                    AS "Used %:Percent:90"
FROM (
    SELECT
        b.cost_center,
        SUM(b.budget_amount) AS budget,

        -- approved purchase orders, value not yet billed
        COALESCE((
            SELECT SUM(poi.base_net_amount - poi.billed_amt)
            FROM `tabPurchase Order Item` poi
            JOIN `tabPurchase Order` po ON po.name = poi.parent
            WHERE po.docstatus = 1
              AND po.status NOT IN ('Closed', 'Completed')
              AND po.company = %(company)s
              AND poi.cost_center = b.cost_center
              AND po.transaction_date BETWEEN %(from_date)s AND %(to_date)s
              AND poi.expense_account IN (
                  SELECT b3.account FROM `tabBudget` b3
                  WHERE b3.docstatus = 1
                    AND b3.company = %(company)s
                    AND b3.cost_center = b.cost_center
              )
        ), 0) AS committed,

        -- posted expense on the accounts budgeted for this cost center
        COALESCE((
            SELECT SUM(gle.debit - gle.credit)
            FROM `tabGL Entry` gle
            WHERE gle.is_cancelled = 0
              AND gle.company = %(company)s
              AND gle.cost_center = b.cost_center
              AND gle.posting_date BETWEEN %(from_date)s AND %(to_date)s
              AND gle.account IN (
                  SELECT b2.account FROM `tabBudget` b2
                  WHERE b2.docstatus = 1
                    AND b2.company = %(company)s
                    AND b2.cost_center = b.cost_center
              )
        ), 0) AS actual

    FROM `tabBudget` b
    WHERE b.docstatus = 1
      AND b.company = %(company)s
      AND b.budget_against = 'Cost Center'
    GROUP BY b.cost_center
) t
ORDER BY (t.committed + t.actual) / NULLIF(t.budget, 0) DESC;

-- ---------------------------------------------------------------------------
-- v15 variant: replace the FROM `tabBudget` b ... GROUP BY block with
--
--   FROM `tabBudget` b
--   JOIN `tabBudget Account` ba ON ba.parent = b.name
--   WHERE b.docstatus = 1 AND b.company = %(company)s
--     AND b.budget_against = 'Cost Center'
--   GROUP BY b.cost_center
--
-- use SUM(ba.budget_amount) for the budget, and in the GL sub-query select
-- ba2.account from `tabBudget Account` ba2 JOIN `tabBudget` b2 ON b2.name = ba2.parent.
