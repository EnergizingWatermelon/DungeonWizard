Feature: DM can generate an adventure with a specified terrain

Scenario: Generate an adventure with a desert terrain
	Given I am on the Adventure Generator page
	When I fill in "Terrain" with "desert"
	And I press "Generate!"
	Then I should be on an adventure page
	And I should see an Adventure
	And I should see a "desert" terrain map
	And I should see a "desert" terrain creature
