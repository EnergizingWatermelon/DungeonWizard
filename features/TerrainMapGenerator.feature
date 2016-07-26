Feature: DM can generate a map with specified terrain

Scenario: Generate a map with a desert terrain
	Given I am on the Map Generator page
	When I fill in "Terrain" with "desert"
	And I press "Generate!"
	Then I should be on a map page
	And I should see a Map
	And I should see a "desert" terrain map
