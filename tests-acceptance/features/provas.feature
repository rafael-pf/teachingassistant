Feature: As a professor
         I want to update students grades
         So that I can easily correct data entry errors or adjust scores after a re-evaluation

Scenario: Updating an existing grade
Given I am at the "Grades" page
And I see a student "João Souza" with grade "MPA" for learning goal "Refactor legacy code"
When I update the grade to "MA" for "João Souza" goal "Refactor legacy code"
Then I’m still at the "Grades" page
And I can see student "João Souza" has grade "MA" for learning goal "Refactor legacy code"
And the old grade "MPA" is no longer visible

Scenario: Canceling a grade update
Given I am at the "Grades" page
And I see a student "Beatriz Rocha" with grade "MPA" for learning goal "Refactor legacy code"
And I have started to edit the grade
When I cancel the grade update
Then I’m still at the "Grades" page
And I can see student "Beatriz Rocha" still has grade "MPA" for learning goal "Refactor legacy code"

Scenario: Attempting to update a grade after the grading period is closed
Given I am at the "Grades" page for the "Software Engineering" course
And a student "Laura Mendes" has grade "MPA" for the learning goal "Deploy application"
And the grading period for the "Software Engineering" course is closed
When I try to update the grade to "MA" for "Laura Mendes" on the goal "Deploy application"
Then I should see an error message "The grading period is closed and grades cannot be modified"
And the grade for "Laura Mendes" must remain "MPA"

Scenario: Attempting to add a grade for a non-existent learning goal
Given I am at the "Grades" page
And I see the student "Roberto Dias" in the list
And the learning goal "Analyze Big Data" does not exist for this course
When I try to add the grade "MA" for "Roberto Dias" under the goal "Analyze Big Data"
Then I should see an error message "Learning goal not found"
And no grade should be recorded for "Roberto Dias" for that attempt
And I am still on the "Grades" page

Scenario: Attempting to add an invalid grade
Given I am at the "Grades" page
And I see a student "Ana Costa" with no grade for learning goal "Debug complex issues"
When I try to add the grade "XYZ" for "Ana Costa" goal "Debug complex issues"
Then I should see an error message "Grade is not valid"
And student "Ana Costa" still has no grade for learning goal "Debug complex issues"

Scenario: Removing an existing grade
Given I am at the "Grades" page
And I see a student "Carlos Lima" with grade "MANA" for learning goal "Write quality tests"
When I remove the grade for "Carlos Lima" goal "Write quality tests"
Then I’m still at the "Grades" page
And I can see student "Carlos Lima" has no grade for learning goal "Write quality tests"
