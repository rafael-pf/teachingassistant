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

Scenario: Removing a grade and verifying the average recalculation
Given I am at the "Grades" page
And the student "Carlos Lima" has grade "MA" (value 10.0) for the learning goal "Write quality tests"
And the student "Carlos Lima" has grade "MPA" (value 7.0) for the learning goal "Refactor legacy code"
And the calculated average for "Carlos Lima" is 8.5
When I remove the grade for "Carlos Lima" on the goal "Write quality tests"
Then I should see a success message "Grade removed successfully"
And I can see student "Carlos Lima" has no grade for learning goal "Write quality tests"
And the calculated average for "Carlos Lima" should now be 7.0

Scenario: Attempting to update a grade that was modified by another user
Given the student "Julia Barroso" has a grade of "MPA" for the learning goal "System modeling"
And I am on the "Grades" page viewing this grade
When another professor updates the grade of "Julia Barroso" to "MA" in the background
And I then try to update the original grade "MPA" to "MANA"
Then I should see an error message "This grade has been modified since you loaded the page. Please refresh to see the latest version."
And the grade for "Julia Barroso" must remain "MA" in the system
