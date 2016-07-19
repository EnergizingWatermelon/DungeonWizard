Feature: DM can generate a simple, random map

Scenario: Generate a simple map
	Given I am on the DungeonWizard home page
	When I follow "Maps"
	Then I should be on the Map Generator page
	When I press "Generate!"
	Then I should be on a map page
	And I should see a Map
