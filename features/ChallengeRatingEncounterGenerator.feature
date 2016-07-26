Feature: DM can generate a simple, random encounter that gives a challenge rating based on the number of players and their initial level

Scenario: Generate an encounter with a CR of 400, based on 2 players with a starting level of 2
	Given I am on the DungeonWizard home page
	When I follow "Encounters"
	Then I should be on the Encounter Generator page
	When I fill in "Player Count" with "2"
	And I fill in "Player Level" with "2"
	And I press "Generate!"
	Then I should be on an encounter page
	And I should see an Encounter
	And I should see a CR of "400 XP"
	
Scenario: Generate an encounter with a CR of 1200, based on 5 players with a starting level of 4
	Given I am on the DungeonWizard home page
	When I follow "Encounters"
	Then I should be on the Encounter Generator page
	When I fill in "Player Count" with "5"
	And I fill in "Player Level" with "4"
	And I press "Generate!"
	Then I should be on an encounter page
	And I should see an Encounter
	And I should see a CR of "1200 XP"