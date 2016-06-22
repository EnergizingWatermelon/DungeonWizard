Feature: DM can find contact information of the website developers

Scenario: Navigate to Contact Us page
	Given I am on the DungeonWizard home page
	When I follow "Contact Us"
	Then I should be on the Contact Us page
	And I should see "Contact Us"
