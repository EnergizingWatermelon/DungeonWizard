Feature: DM can generate a map with specified climate

Scenario: Generate a map with an arid climate
	Given I am on the Map Generator page
	When I select "Arid" from "Climate"
	And I press "Generate Map"
	Then I should be on the Map Generator page
	And I should see a Map
	And I should see "Arid"
