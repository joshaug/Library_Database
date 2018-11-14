CREATE OR REPLACE PROCEDURE MembersWithSignificantFine
AS
   SELECT member.name,SUM(account.fine) AS Total_Fine
   FROM member JOIN account ON member.member_id = account.member_id
   GROUP BY name
   HAVING Total_fine > 20;
   

CREATE OR REPLACE PROCEDURE MembersNameAndAddress
AS
   SELECT name AS Full_Name, address
   FROM member
   WHERE member.member_id NOT EXISTS
                                 (SELECT *
                                  FROM account
                                  WHERE member.member_id <> loan.member_id);