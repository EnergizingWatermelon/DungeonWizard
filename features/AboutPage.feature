Feature: Websurfer can find a quick summary of the website

Scenario: Navigate to About page
	Given I am on the DungeonWizard home page
	When I follow "About"
	Then I should be on the About page
	And I should see "About"
