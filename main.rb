require_relative 'robot'
robot = Robot.new
while line = gets
  robot.execute(line.strip)
  puts robot.output if robot.output
end