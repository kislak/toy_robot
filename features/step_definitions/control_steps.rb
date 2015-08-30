Then(/^I should see "([^"]*)"$/) do |msg|
  expect(@robot.execute('REPORT')).to include(msg)
end

When(/^Place robot to (\d+),(\d+) facing "([^"]*)"$/) do |x, y, facing|
  @robot.execute("PLACE #{x},#{y},#{facing}")
end

When(/^order to move$/) do
  @robot.execute('MOVE')
end
