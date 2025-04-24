select * from sales;

select * from sales
where Amount>8000
order by Amount desc
limit 5;


select p.Team,sum(s.Amount)
from sales s
join people p
on  p.SPID=s.SPID
group by p.Team;

-- left join

select p.Salesperson,sum(s.Amount) Total_Amount,avg(s.Amount) Average_Amount
from people p
left join sales s
on s.SPID=p.SPID
group by p.Salesperson
order by Total_Amount desc
limit 3;

-- right join 
select pro.product,sum(s.Amount) as Total_sale
from products pro
right join sales s
on s.PID=pro.PID
group by Pro.product;

-- SUBQUERY 

SELECT Team, SUM(Amount) AS TotalSales
FROM (
    SELECT s.Amount, p.Team
    FROM sales s
    JOIN people p ON s.SPID = p.SPID
    WHERE s.Amount > 22000
) AS filtered_sales
GROUP BY Team;

-- View for top 3 salespersons based on total sales
CREATE VIEW top_salespersons AS
SELECT p.Salesperson, SUM(s.Amount) AS Total, AVG(s.Amount) AS Average FROM people p
    LEFT JOIN sales s ON s.SPID = p.SPID
    GROUP BY p.Salesperson
    ORDER BY Total DESC
    limit 3;
    
select * from top_salespersons;

CREATE INDEX idx_sales_spid ON sales(SPID);
CREATE INDEX idx_sales_pid ON sales(PID);
CREATE INDEX idx_people_spid ON people(SPID);




