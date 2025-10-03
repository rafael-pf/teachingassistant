Feature: As a professor
         I want to generate individual exams for each student
         So that each student has a unique test

Scenario: Generating individual exams for all registered students
Given the system has students registered with CPFs "685", "686" and "687"
And none of these students have individual exams assigned
When I generate exams for all registered students
Then the system creates unique exams for "685", "686" and "687"
And I can see one unique exam per student in the exams list

Scenario: Preventing exam duplication across students
Given the system has already generated unique exams for students "Mari" and "Paulo"
When I compare the exam assigned to "Mari" with the exam assigned to "Paulo"
Then I can confirm the exams are not identical
And each exam contains a unique combination of questions