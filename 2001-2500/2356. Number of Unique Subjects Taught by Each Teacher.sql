# Write your MySQL query statement below
# Solution by Sergey Leschev

SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id