Feature: As a professor
         I want to generate individual exams for each student
         So that each student has a unique test

Scenario: Generating an individual exam for a student without an existing exam
Given I am at the exams page
And I cannot see any exam assigned to student "Mari" with CPF "683"
When I generate an individual exam for student "Mari" with CPF "683"
Then I can see a unique exam assigned to "Mari" with CPF "683" in the exams list

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

Scenario: Trying to generate an exam for a student not registered in the system
Given I am at the exams page
And the system has no student with CPF "690"
When I try to generate an individual exam for student "Lucas" with CPF "690"
Then I cannot see any exam created for "Lucas"
And I can see an error message "Student not found"

Scenario: Trying to generate an exam with no questions available in the question bank
Given I am at the exams page
And the question bank is empty
When I try to generate an individual exam for student "Mari" with CPF "683"
Then the system does not create an exam
And I can see an error message "No questions available to generate exam"