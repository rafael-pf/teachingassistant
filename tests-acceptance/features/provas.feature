Feature: As a professor
         I want to update students grades
         So that I can easily correct data entry errors or adjust scores after a re-evaluation

Scenario: Updating an existing grade
Given I am at the "Grades" page
And I see a student "João Souza" with grade "MPA" for learning goal "Refactor legacy code"
When I update the grade to "MA" for "João Souza" goal "Refactor legacy code"
Then I’m still at the "Grades" page
And I can see student "João Souza" has grade "MA" for learning goal "Refactor legacy code"
And the old grade "PA" is no longer visible

Scenario: Canceling a grade update
Given I am at the "Grades" page
And I see a student "Beatriz Rocha" with grade "MPA" for learning goal "Refactor legacy code"
And I have started to edit the grade
When I cancel the grade update
Then I’m still at the "Grades" page
And I can see student "Beatriz Rocha" still has grade "MPA" for learning goal "Refactor legacy code"

Scenario: Attempting to update a grade after the grading period is closed
Given I am at the "Grades" page for the "Software Engineering" course
And a student "Laura Mendes" has grade "PA" for the learning goal "Deploy application"
And the grading period for the "Software Engineering" course is closed
When I try to update the grade to "MA" for "Laura Mendes" on the goal "Deploy application"
Then I should see an error message "The grading period is closed and grades cannot be modified"
And the grade for "Laura Mendes" must remain "PA"

Scenario: Attempting to add a grade for a non-existent learning goal
Given I am at the "Grades" page
And I see the student "Roberto Dias" in the list
And the learning goal "Analyze Big Data" does not exist for this course
When I try to add the grade "MA" for "Roberto Dias" under the goal "Analyze Big Data"
Then I should see an error message "Learning goal not found"
And no grade should be recorded for "Roberto Dias" for that attempt