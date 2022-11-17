--Employee_Database_Challenge

SELECT Count (e.emp_no), e.emp_no,
	e.first_name,
	e.last_name,
	--ti.title,
	--ti.from_date,
	--ti.to_date
--INTO retirement_titles
FROM employees as e
LEFT JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
GROUP BY e.emp_no
ORDER BY e.emp_no;


SELECT * FROM retirement_titles;



-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
					rt.first_name,
					rt.last_name,
					rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE to_date = '9999-01-01'
ORDER BY rt.emp_no, rt.to_date DESC;


SELECT * FROM unique_titles;



Drop table retiring_titles;
--Count the number of retiring by title
SELECT COUNT(ut.title), ut.title
--INTO retiring_titles
FROM unique_titles as ut
GROUP BY title
ORDER BY count desc;


SELECT * FROM retiring_titles;

SELECT COUNT(*)
	FROM unique_titles;

--Create Mentorship Eligibilty
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	titles.title
--INTO mentorship_eligibility
FROM employees as e
LEFT JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
LEFT JOIN titles
ON (e.emp_no = titles.emp_no)
WHERE de.to_date = '9999-01-01'
AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;





SELECT COUNT(DISTINCT e.emp_no) FROM mentorship_eligibility as e;
