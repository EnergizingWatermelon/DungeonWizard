Feature: DM can find instructions about the generators

Scenario: Navigate to Instructions page
	Given I am on the DungeonWizard home page
	When I follow "Instructions"
	Then I should be on the Instructions page
	And I should see text
