Feature: DM can generate an encounter with a specified terrain

Scenario: Generate an encounter with a Forest terrain
	Given I am on the Encounter Generator page
	When I fill in "Terrain" with "Forest"
	And I fill in "Climate" with "Any"
	And I fill in "Player Count" with "2"
	And I fill in "Player Level" with "2"
	And I press "Generate!"
	Then I should be on an encounter page
	And I should see an Encounter
	And I should see a "Forest" terrain creature
