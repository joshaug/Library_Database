CREATE TRIGGER `bookout` AFTER INSERT ON `loans`
 FOR EACH ROW UPDATE book SET on_loan = 'yes' 
WHERE book_id = NEW.book_id

CREATE TRIGGER `latebook` AFTER INSERT ON `account`
 FOR EACH ROW UPDATE loans SET late = 'yes' 
WHERE loans.loan_id = NEW.loan_id