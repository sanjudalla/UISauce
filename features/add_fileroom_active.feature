@regression @smoke
Feature: Documents - Filerooms
	As a Merrill user
	I want to add fileroom
	So that I can upload files in it later

  @fileroom
  Scenario: Add fileroom activated
    When I click Add fileroom
    Then I enter the fileroom name "Automation"
    Then I click on add button available on window prompt
    Then I should see "Automation" in the tree
