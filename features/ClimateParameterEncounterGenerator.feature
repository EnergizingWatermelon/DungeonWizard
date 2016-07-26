Feature: DM can generate an encounter with specified climate

Scenario: Generate an encounter with an arid climate
	Given I am on the Encounter Generator page
	When I fill in "Climate" with "Arid"
	And I press "Generate!"
	Then I should be on an encounter page
	And I should see an Encounter
	And I should see a "Arid" climate creature
