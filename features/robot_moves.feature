Feature: Play with robot. Move.
  Scenario: Move north
    Given Robot exists
    When Place robot to 2,2 and move "NORTH"
    When Then I should see 3,2

  Scenario: Move east
    Given Robot exists
    When Place robot to 2,2 and move "EAST"
    When Then I should see 2,3

  Scenario: Move west
    Given Robot exists
    When Place robot to 2,2 and move "WEST"
    When Then I should see 2,1

  Scenario: Move south
    Given Robot exists
    When Place robot to 2,2 and move "SOUTH"
    When Then I should see 1,2
