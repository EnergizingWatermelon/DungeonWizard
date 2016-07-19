Feature: DM can generate a simple, random adventure

Scenario: Generate a simple adventure
	Given I am on the DungeonWizard home page
	When I follow "Adventures"
	Then I should be on the Adventure Generator page
	When I press "Generate!"
	Then I should be on an adventure page
	And I should see a Map
	And I should see an Encounter
