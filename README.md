# Customer Churn & Revenue Analysis

## The story behind the numbers

### Problem

A subscription business depends on customers staying long enough to generate recurring revenue. In this dataset, **6,234 of 50,000 customers are marked churned**, giving an overall churn rate of **12.47%**. That headline KPI shows the scale of customer loss, but it does not say which customers are leaving, what experiences may be connected with churn, or where retention efforts should start.

Without segmenting the results, a business may treat every customer the same: spending effort on customers who are not at risk while missing people who may be struggling with the service. This analysis compares churn across contract type, tenure, support activity, city, and other customer attributes, and examines estimated revenue exposure. These comparisons can help guide investigation, but they cannot prove why a particular customer left.

### KPI analysis: what the data says

| KPI | Result | Interpretation |
| --- | --- | --- |
| Overall churn | **12.47%** (6,234 of 50,000) | The baseline for comparing customer segments. |
| Contract type | **17.30%** month-to-month; **8.14%** one-year; **4.64%** two-year | Churn is highest among flexible month-to-month customers. Contract type is associated with churn here; it is not necessarily the cause. |
| Support tickets | **8.37%** with 0 tickets; **10.88%** with 1; **15.09%** with 2; **18.59%** with 3; **24.30%** with 4 or more | Churn increases with ticket count in the saved analysis, making repeated support contact a signal to investigate. |
| Tenure | **20.55%** for 1–12 months in the dashboard | The earliest tenure band has the highest churn rate shown, suggesting onboarding and early service experience deserve attention. |
| City | **13.71%** Kolkata; **13.21%** Lucknow; **11.97%** Hyderabad | Differences may help focus local investigation, while accounting for customer mix and segment sizes. |
| Estimated revenue loss by contract | **50.23M** month-to-month; **10.93M** one-year; **4.89M** two-year | Month-to-month accounts have the largest estimated annualized loss in the saved SQL result. The data does not specify currency. |

### Churn story

Roughly **one customer in eight** is marked churned. The overall number becomes more useful when it is broken into groups: the churn rate is **17.30%** among month-to-month customers, compared with **4.64%** among two-year customers. That gap makes flexible-plan customers a sensible place to examine the customer journey: what value they experience, what obstacles arise, and whether clear plan options or timely check-ins might help.

The support KPI adds another signal. Customers with four or more tickets have a **24.30%** churn rate, nearly three times the **8.37%** rate for customers with no tickets. This pattern is consistent with repeated service friction being a retention concern, though these summary figures do not establish whether tickets happened before churn or explain it.

The dashboard also shows higher churn in the shortest tenure band. This points to onboarding, setup, and early support as useful areas to review. Location provides further context: Kolkata and Lucknow are at the high end of the city comparison, while Hyderabad is at the low end. These differences should prompt questions about customer mix and service experience, not assumptions about city-level causes.

Finally, the revenue-loss output shows the commercial impact: the largest estimated annualized loss is attached to month-to-month churn. Taken together, these KPIs suggest focusing investigation on new and flexible-plan customers who are contacting support repeatedly, then measuring whether targeted help improves retention.

## Solution: a practical retention approach

1. **Prioritize review.** Create a review list of active month-to-month customers with short tenure and repeated support calls. The included SQL uses tenure of 12 months or less and at least three calls as a starting rule, not as a validated prediction model.
2. **Address the customer’s issue.** Check recent ticket details, escalation status, and resolution time. Resolve recurring problems and follow up with the customer.
3. **Offer relevant options.** After understanding the customer's needs, consider plan guidance or a suitable service remedy. Do not assume every customer should move to a longer contract.
4. **Measure the outcome.** Track overall and segment churn rates, ticket counts and resolution time, payment status, and estimated revenue retained. Compare outcomes before and after an intervention, ideally with a suitable comparison group.
5. **Improve the approach.** Recalculate the KPIs regularly and refine the outreach criteria based on observed results.

## Dashboard preview

The Power BI dashboard presents total customers, churn rate, estimated revenue lost, and churn comparisons by contract type, tenure, internet service, support-call count, and payment method. Use its slicers to explore city, contract, and service segments.

![Customer Churn Analysis dashboard](<customer_churn_powerbi_new_dashboard /DASHBOARD.jpeg>)

The dashboard headline KPIs are **50K customers**, **12.47% churn**, and **66.04M revenue lost**. Revenue loss is an estimate, and the currency is not specified in the source files.

## Project files

- `DATASET/customer_churn_master_50000.csv`: 50,000-row customer-level analysis table.
- `DATASET/customers.csv`: customer profile and signup fields.
- `DATASET/subscriptions.csv`: contract, service, usage, charges, and churn fields.
- `DATASET/payments.csv`: monthly payment activity and payment status.
- `DATASET/support_tickets.csv`: support ticket details.
- `SQL QUERIES/`: database setup, table definitions, and analysis queries.
- `QUERY RESULT/`: saved outputs from the example SQL analyses.
- `Excel/`: Excel versions of the customer master data.
- `customer_churn_powerbi_new_dashboard /`: Power BI project and dashboard image.

Use `customer_id` to connect customer, subscription, payment, and support-ticket records. In the subscription data, `churn` is coded `1` for churned and `0` for active. The `synthetic_churn_probability_for_demo_only` field is for demonstration only and is not a production risk score. Churn associations are descriptive and do not establish causation. Confirm dataset provenance and permitted use before treating this as operational customer data.
