Feature: Play with robot
  Scenario: Robot ignore commands when is not on board
    Given Robot exists
    And robot does not report
    When I command to move
    Then robot does not report
    When I command to turn left
    Then robot does not report
    When I commnad to turn right
    Then robot does not report

  Scenario: Place robot on board
    Given Robot exists
    When I place robot on bord
    Then robort reports
