Feature: DM can generate a simple, random encounter that gives a challenge rating based on the number of players and their initial level

Scenario: Generate an encounter with a CR of 600, based on 8 players with a starting level of 1
	Given I am on the DungeonWizard home page
	When I follow "Encounters"
	Then I should be on the Encounter Generator page
	When I fill in "Player Count" with "8"
	And I fill in "Player Level" with "1"
	And I press "Generate!"
	Then I should be on an encounter page
	And I should see an Encounter
	And I should see a CR of "600 XP"
