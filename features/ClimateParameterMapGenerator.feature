Feature: DM can generate a map with specified climate

Scenario: Generate a map with an arid climate
	Given I am on the Map Generator page
	When I fill in "Climate" with "Warm"
	And I press "Generate!"
	Then I should be on a map page
	And I should see a Map
	And I should see a "Arid" terrain map
