----------------------------------------------------------------------------------------------------------
-- Deliverable 1
----------------------------------------------------------------------------------------------------------

--Retirement Table
SELECT e.emp_no,
                e.first_name,
                e.last_name,
                t.title,
                t.from_date,
                t.to_date
INTO retirees_titles
FROM employees AS e
        INNER JOIN titles AS t
                ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;
--Show Table
SELECT * FROM retirees_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirees_titles AS rt
WHERE rt.to_date = ('9999-01-01')
ORDER BY emp_no, title DESC;

--Show Table
SELECT * FROM unique_titles

--Number of Employees by Most Recent Job Title
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY count DESC;

--Show Table
SELECT * FROM retiring_titles

----------------------------------------------------------------------------------------------------------
--Deliverable 2
----------------------------------------------------------------------------------------------------------

--Mentorship Eligibility table
SELECT DISTINCT ON (e.emp_no) e.emp_no,
                        e.first_name,
                        e.last_name,
                        e.birth_date,
                        de.from_date,
                        de.to_date,
                        t.title

INTO mentorship_table
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1962-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;

--Show Table
SELECT * FROM mentorship_table