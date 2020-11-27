Feature: control examples
  Scenario: 1
    Given Robot exists
    When Place robot to 0,0 and move "NORTH"
    Then I should see "0,1,NORTH"

  Scenario: 2
    Given Robot exists
    When Place robot to 0,0 facing "NORTH"
    When I command to turn left
    Then I should see "0,0,WEST"

  Scenario: 3
    Given Robot exists
    When Place robot to 1,2 facing "EAST"
    And order to move
    And order to move
    And I command to turn left
    And order to move
    Then I should see "3,3,NORTH"

  Scenario: 4
    Given Robot exists
    When Place robot to 3,2 facing "NORTH"
    And order to move
    And order to move
    And order to move
    And order to move
    And order to move
    And order to move
    Then I should see "3,4,NORTH"
