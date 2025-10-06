Feature: As a professor
         I want to register the answers of the exam
         So that the exams can be corrected

Scenario: Registering answers for an existing exam
Given I am at the exam details page
And the exam for student "Daniel" with CPF "123" exists
And the exam currently has no registered answers
When I register the answers for the exam
Then the exam should display the registered answers
And the exam status should be updated to "Ready for correction"

Scenario: Attempting to register answers for a non-existing exam
Given I am at the exams page
And there is no exam assigned to student "Daniel" with CPF "123"
When I try to register answers for the exam
Then I should see an error message indicating that the exam does not exist
And no answers should be registered in the system

Scenario: Attempting to register answers with incomplete data
Given I am at the exam details page
And the exam for student "Mari" with CPF "683" exists
When I try to register the exam answers leaving some questions unanswered
Then I should see a warning message indicating that all questions must be answered
And the system should not save the incomplete answers

Scenario: Attempting to register answers for a closed or corrected exam
Given I am at the exam details page
And the exam for student "Mari" with CPF "683" exists
And the exam status is "Closed"
When I try to register or modify the answers
Then I should see an error message indicating that the exam cannot be modified
And no changes should be saved in the system
And the exam status should remain as "Closed"

Scenario: Updating previously registered answers
Given I am at the exam details page
And the exam for student "Mari" with CPF "683" exists
And the exam already has registered answers
When I update some of the exam answers
Then the updated answers should be saved successfully
And the exam should display the new answers
And the modification date of the exam should be updated

Scenario: Attempting to register answers with invalid format
Given I am at the exam details page
And the exam for student "Mari" with CPF "683" exists
When I try to register answers using an invalid format
Then I should see an error message indicating that the format of the answers is invalid
And the system should reject the submission
And no invalid answers should be saved in the exam record
And the exam status should remain as "Closed"

Scenario: Successfully registering answers for multiple students
Given I am at the exams page
And there are exams assigned to students "Mari" with CPF "683" and "João" with CPF "924"
And both exams currently have no registered answers
When I register the answers for both exams
Then the system should save the answers for each exam correctly
And each exam should display the registered answers
And the status of both exams should be updated to "Ready for correction"