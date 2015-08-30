When(/^Place robot to (\d+),(\d+) and move "([^"]*)"$/) do |x, y, facing|
  @robot.execute("PLACE #{x},#{y},#{facing}")
  @robot.execute('MOVE')
end

When(/^Then I should see (\d+),(\d+)$/) do |x, y|
  expect(@robot.execute('REPORT')).to include("#{x},#{y}")
end

