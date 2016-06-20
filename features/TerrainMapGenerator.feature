Feature: DM can generate a map with specified terrain

Scenario: Generate a desert map
	Given I am on the Map Generator page
	When I select the "Terrain" drop-down
	Then I should see a drop-down box
	When I press "desert"
	Then I should be on the Map Generator page
	And I should see a Map
	And I should see "desert" in the Terrain form
