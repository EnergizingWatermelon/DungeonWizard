Feature: DM can generate an adventure with a specified terrain

Scenario: Generate an adventure with a Forest terrain
	Given I am on the Adventure Generator page
	When I fill in "Terrain" with "Forest"
	And I fill in "Climate" with "Any"
	And I fill in "Player Count" with "2"
	And I fill in "Average Player Level" with "2"
	And I press "Generate!"
	Then I should be on an adventure page
	And I should see an Adventure
	And I should see a "forest" terrain map
	And I should see a "forest" terrain creature
