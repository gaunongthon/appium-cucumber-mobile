Feature: Verify Calculator functionalities

  Scenario: Click on OK button
    Then I wipe out screen

  Scenario: Addirion
    Then I click on digit 5
    Then I click on plus
    Then I click on digit 9
    When I click on equal
    Then I verify the result is 14

	Scenario: Clear output
	 Then I click on clear
