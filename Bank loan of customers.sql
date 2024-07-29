USE bank_analyics;
SELECT* from  finance_1 ;
SELECT * FROM finance_2;

-- KPI1 - YEAR WISE LOAN AMOUNT

select right(issue_d,4) as year_of_issue_d, sum(loan_amnt) as total_Loan_Amount
from finance_1
group by year_of_issue_d
order by year_of_issue_d ;

-- ----------------------------------------------------------------------------------------------------
-- KPI2 - GRADE - SUBGRADE WISE REVOL BAL

select grade, sub_grade, sum(revol_bal) as Total_Revol_Bal
from finance_1, finance_2
where finance_1.id = finance_2.id
group by sub_grade, grade
order by sub_grade;

-- -----------------------------------------------------------------------------------------------------

-- KPI3 - VERIFICATION STATUS WISE TOTAL PAYMENT 

select verification_status, round(sum(total_pymnt),2) as Total_Payment
from finance_1, finance_2
where finance_1.id = finance_2.id and (verification_status = "verified" or verification_status= "Not Verified")
group by verification_status;

-- ----------------------------------------------------------------------------------------------------------------------------

-- KPI4 - STATE WISE AND MONTHWISE LOAN STATUS

SELECT ADDR_STATE AS STATE, right(issue_d,7)AS Month, LOAN_STATUS FROM FINANCE_1
INNER JOIN finance_2 WHERE FINANCE_1.ID = FINANCE_2.ID
GROUP BY STATE, issue_d, LOAN_STATUS
ORDER BY issue_d;

-- --------------------------------------------------------------------------------------------------------------------------------
-- KPI5 - HOME OWNERSHIP VS LAST PAYMENT DATE STATS

SELECT HOME_OWNERSHIP, LAST_PYMNT_D, CONCAT("$", FORMAT(LAST_PYMNT_AMNT, 2)) AS LAST_PAYMENT FROM FINANCE_1
INNER JOIN finance_2 WHERE FINANCE_1.ID = FINANCE_2.ID
GROUP BY HOME_OWNERSHIP , LAST_PYMNT_D , LAST_PYMNT_AMNT
ORDER BY HOME_OWNERSHIP ,LAST_PYMNT_D desc,LAST_PYMNT_AMNT desc;

-- ------------------------------------------------------------------------------------------------------------------------------



 



