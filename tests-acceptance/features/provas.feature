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