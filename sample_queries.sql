-- 1️⃣ List all customers with their accounts
SELECT c.customer_id, c.first_name, c.last_name, a.account_id, a.balance
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id;

-- 2️⃣ Total balance in the bank
SELECT SUM(balance) AS total_bank_balance FROM accounts;

-- 3️⃣ Get top 3 customers with the highest balance
SELECT c.first_name, c.last_name, SUM(a.balance) AS total_balance
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id
ORDER BY total_balance DESC
LIMIT 3;

-- 4️⃣ Loan eligibility check (customers without loans)
SELECT c.first_name, c.last_name
FROM customers c
LEFT JOIN loans l ON c.customer_id = l.customer_id
WHERE l.customer_id IS NULL;

-- 5️⃣ Total loan amount by status
SELECT loan_status, SUM(loan_amount) AS total_amount
FROM loans
GROUP BY loan_status;
