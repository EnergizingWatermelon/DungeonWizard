Feature: DM can generate a map with specified terrain

Scenario: Generate a map with a Forest terrain
	Given I am on the Map Generator page
	When I fill in "Terrain" with "forest"
	And I press "Generate!"
	Then I should be on a map page
	And I should see a Map
	And I should see a "forest" terrain map
