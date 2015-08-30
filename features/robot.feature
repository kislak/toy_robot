Feature: Play with robot
  Scenario: Robot ignore commands when is not on board
    Given Robot exists
    And robot does not report
    When I command to move
    Then robot does not report
    When I command to turn left
    Then robot does not report
    When I command to turn right
    Then robot does not report

  Scenario: Place robot on board
    Given Robot exists
    When I place robot on bord
    Then robort reports

  Scenario: Turn right
    Given Robot exists
    When I place robot on bord face to the south
    And I command to turn right
    Then I should see robot face west

    When I command to turn right
    Then I should see robot face north

    When I command to turn right
    Then I should see robot face east

    When I command to turn right
    Then I should see robot face south

  Scenario: Turn left
    Given Robot exists
    When I place robot on bord face to the south
    And I command to turn left
    Then I should see robot face east

    When I command to turn left
    Then I should see robot face north

    When I command to turn left
    Then I should see robot face west

    When I command to turn left
    Then I should see robot face south
