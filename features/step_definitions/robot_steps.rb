Given(/^Robot exists$/) do
  @robot = Robot.new
end

Given(/^robot does not report$/) do
  expect(@robot.execute('REPORT')).to eq(nil)
end

When(/^I command to move$/) do
  @robot.execute('MOVE')
end

When(/^I command to turn left$/) do
  @robot.execute('LEFT')
end

When(/^I commnad to turn right$/) do
  @robot.execute('RIGHT')
end

When(/^I place robot on bord$/) do
  @robot.execute('PLACE 0,0,NORTH')
end

Then(/^robort reports$/) do
  expect(@robot.execute('REPORT'))
    .to match(/([0-4]),([0-4]),(EAST|NORTH|WEST|SOUTH)/)
end
