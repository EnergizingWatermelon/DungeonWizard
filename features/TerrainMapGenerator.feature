Feature: DM can generate a map with specified terrain

Scenario: Generate a map with a desert terrain
	Given I am on the Map Generator page
	When I select "desert" from "Terrain"
	And I press "Generate Map"
	Then I should be on the Map Generator page
	And I should see a Map
	And I should see "desert"
