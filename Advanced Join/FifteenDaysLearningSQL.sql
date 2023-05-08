WITH Submission_Rank AS (
SELECT hacker_id, submission_date, 
DENSE_RANK() OVER (
    ORDER BY submission_date
) AS dense_rnk
FROM Submissions),
Rank_And_Submission AS (
SELECT sr.hacker_id as hacker_id, sr.submission_date as submission_date, sr.dense_rnk as dense_rnk,
    CASE WHEN sr.submission_date = TO_DATE('2016-03-01', 'yyyy-mm-dd') THEN 1
    ELSE 1 + (SELECT COUNT(DISTINCT s.submission_date) FROM Submissions s WHERE 
             sr.hacker_id = s.hacker_id AND s.submission_date < sr.submission_date)
    END AS prev_count
FROM Submission_Rank sr),
Final_unique_submission AS (
SELECT submission_date, COUNT(DISTINCT hacker_id) as unique_submission
FROM Rank_And_Submission 
WHERE dense_rnk = prev_count
GROUP BY submission_date
ORDER BY submission_date),
count_submission AS (
    SELECT hacker_id, submission_date, count(submission_id) as no_of_submission
    FROM Submissions
    GROUP BY hacker_id, submission_date), 
rank_submission AS (
SELECT hacker_id, submission_date, no_of_submission,
RANK() OVER (
    PARTITION BY submission_date
    ORDER BY no_of_submission DESC, hacker_id
) AS submission_rank
FROM  count_submission)
SELECT fus.submission_date, fus.unique_submission, rs.hacker_id, h.name
FROM Final_unique_submission fus
JOIN rank_submission rs ON (fus.submission_date = rs.submission_date)
JOIN Hackers h ON (rs.hacker_id = h.hacker_id)
WHERE rs.submission_rank = 1
ORDER BY fus.submission_date;