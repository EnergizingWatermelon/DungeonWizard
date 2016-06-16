Feature: DM can generate a simple, random encounter

Scenario: Generate a simple encounter
	Given I am on the DungeonWizard home page
	When I follow "Encounter Generator"
	Then I should be on the Encounter Generator page
	When I press "Generate Encounter"
	Then I should be on the Encounter Generator page
	And I should see an Encounter
