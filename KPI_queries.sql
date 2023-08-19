select * from Finance1;
select * from Finance2;
select * from  [FinanceP].[dbo].[Sheet1$];

--Year wise loan amount Stats
select  Year(issue_d) as Year,Avg(loan_amnt) as Avgloadamount from Finance1 as F1 
left join Finance2 as F2 on F1.id=F2.id 
group by Year(issue_d) order by Year;

--Grade and sub grade wise revol_bal
select  F1.grade,F1.Sub_grade,Sum(revol_bal) from Finance1 as F1 
left join Finance2 as F2 on F1.id=F2.id 
group by grade,Sub_grade order by Sub_grade; 

--Total Payment for Verified Status Vs Total Payment for Non Verified Status
select  verification_status,Sum(total_pymnt) from Finance1 as F1 
left join Finance2 as F2 on F1.id=F2.id 
group by verification_status order by verification_status; 

--State wise and last_credit_pull_d wise loan status
select  distinct addr_state,YEAR(last_credit_pull_d),loan_status,count(loan_status) as countofloanstatus from Finance1 as F1 
left join Finance2 as F2 on F1.id=F2.id 
group by addr_state,YEAR(last_credit_pull_d),loan_status order by YEAR(last_credit_pull_d)

--Home ownership Vs last payment date stats
select home_ownership,count(last_pymnt_d),YEAR(last_pymnt_d) from Finance1 as F1 
left join Finance2 as F2 on F1.id=F2.id 
group by home_ownership,last_pymnt_d

select home_ownership,count(F1.id),YEAR(last_pymnt_d) from Finance1 as F1 
left join Finance2 as F2 on F1.id=F2.id 
group by home_ownership,F1.id,Year(last_pymnt_d)


select  distinct loan_status,count(loan_status) as countofloanstatus from Finance1 as F1 
left join Finance2 as F2 on F1.id=F2.id 
group by loan_status order by YEAR(last_credit_pull_d)


select * from Finance1 as F1 
left join Finance2 as F2 on F1.id=F2.id 

select AVG(loan_amnt) from Finance1;
 
  