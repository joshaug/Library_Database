/*names of members who have a total fine greater than 5 */

SELECT member.name,SUM(account.fine) AS Total_Fine 
FROM member 
JOIN loans ON member.member_id = loans.member_id 
JOIN account ON loans.loan_id = account.loan_id 
GROUP BY name HAVING Total_fine > 5

/*names of members who have borrowed more than 1 book */
SELECT member.name
FROM member
WHERE member.member_id IN(SELECT loans.member_id
                           FROM loans GROUP BY member_id  
                            HAVING COUNT(member_id)>1);
/*author who has written most books */
SELECT author, COUNT(*) AS 'Books_Written'
FROM author
GROUP BY author
HAVING MAX(book_id);                       

/*View*/
CREATE VIEW [Most Prolific Author] AS
SELECT author, COUNT(*) AS 'Books_Written'
FROM author
GROUP BY author
HAVING MAX(book_id);

CREATE INDEX author_search
ON author(author);

CREATE INDEX member_search
ON loans(member_id);

CREATE INDEX publisher_find
ON book(publisher);





