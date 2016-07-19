Feature: DM can transfer seamlessly between generators on the website

Scenario: Navigating
	Given I am on the DungeonWizard home page
	When I follow "Encounters"
	Then I should be on the Encounter Generator page
	When I follow "Maps"
	Then I should be on the Map Generator page
	When I follow "Adventures"
	Then I should be on the Adventure Generator page