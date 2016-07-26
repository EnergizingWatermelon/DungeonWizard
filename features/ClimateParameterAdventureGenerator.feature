Feature: DM can generate an adventure with specified climate

Scenario: Generate an adventure with an arid climate
	Given I am on the Adventure Generator page
	When I fill in "Climate" with "Arid"
	And I press "Generate!"
	Then I should be on an adventure page
	And I should see an Adventure
	And I should see a "Arid" climate map
	And I should see a "Arid" climate creature
