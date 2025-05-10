## Explanation of normalization steps for Airbnb_Clone Database Schema

1. First Normal Form (1NF)

Status: Compliant

Reason: All attributes in every table are atomic. There are no repeating groups or multi-valued columns.

2. Second Normal Form (2NF)

Status: Compliant

Reason: All tables have single-column primary keys, so there are no partial dependencies. Every non-key attribute is fully dependent on the primary key.

3. Third Normal Form (3NF)

Status: Compliant

Reason: There are no transitive dependencies. All non-key attributes depend only on the primary key and not on other non-key attributes.

so each table is normalized to 3NF 
