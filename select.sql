# 1.Query the existence of 1 course
select * from course where id=1;
# 2.Query the presence of both 1 and 2 courses
select * from course where exists(
select * from course where id=1) and exists(
select * from course where id =2) and (id=1 or id =2);
# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
select id,name,avg(score) from student,student_course where id=studentId group by score having avg(score)>=60;
# 4.Query the SQL statement of student information that does not have grades in the student_course table
select * from student where id not in (select studentId from student_course);
# 5.Query all SQL with grades
select * from student where id in (select studentId from student_course group by studentId);
# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
select student.* from student,student_course where id=studentId and courseId =1 and studentId in (select studentId from student_course where courseId =2);
# 7.Retrieve 1 student score with less than 60 scores in descending order
select * from student,student_course where id=studentId AND score<60 order by score desc LIMIT 1;
# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
select course.name,avg(score) from course,student_course where id=courseId group by courseId order by avg(score) desc, courseId asc;
# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
select student.name,score from student_course left join student on student_course.studentId=student.id left join course on student_course.courseId=course.id where course.name="Math" and score<60;