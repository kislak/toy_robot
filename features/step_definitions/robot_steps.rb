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

When(/^I command to turn right$/) do
  @robot.execute('RIGHT')
end

When(/^I place robot on bord$/) do
  @robot.execute('PLACE 0,0,NORTH')
end

Then(/^robort reports$/) do
  expect(@robot.execute('REPORT'))
    .to match(/([0-4]),([0-4]),(EAST|NORTH|WEST|SOUTH)/)
end

When(/^I place robot on bord face to the south$/) do
  @robot.execute('PLACE 0,0,SOUTH')
end

Then(/^I should see robot face west$/) do
  expect(@robot.execute('REPORT')).to include('WEST')
end

Then(/^I should see robot face north$/) do
  expect(@robot.execute('REPORT')).to include('NORTH')
end

Then(/^I should see robot face east$/) do
  expect(@robot.execute('REPORT')).to include('EAST')
end

Then(/^I should see robot face south$/) do
  expect(@robot.execute('REPORT')).to include('SOUTH')
end
