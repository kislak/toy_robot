# Represent toy robot
class Robot
  VALID_RANGE = (0..4)
  FACINGS = %w(EAST NORTH WEST SOUTH)
  PLACE_REGEXP = /PLACE ([0-4]),([0-4]),(EAST|NORTH|WEST|SOUTH)/
  attr_accessor :output

  def execute(instruction)
    @instruction = instruction
    self.output = nil

    place && return
    return unless on_board?

    report || turn || (move if safe?)
  end

  protected

  def place
    return unless @instruction =~ PLACE_REGEXP
    @x = Regexp.last_match[1].to_i
    @y = Regexp.last_match[2].to_i
    @facing = Regexp.last_match[3]
  end

  def report
    self.output = "#{@x},#{@y},#{@facing}" if @instruction == 'REPORT'
  end

  def turn
    @facing = FACINGS[FACINGS.index(@facing) - 4 + 1] if @instruction == 'LEFT'
    @facing = FACINGS[FACINGS.index(@facing) - 1] if @instruction == 'RIGHT'
  end

  def move
    return unless @instruction == 'MOVE'
    @y += 1 if @facing == FACINGS[1]
    @y -= 1 if @facing == FACINGS[3]
    @x += 1 if @facing == FACINGS[0]
    @x -= 1 if @facing == FACINGS[2]
  end

  def safe?
    imaginary = clone
    imaginary.move
    imaginary.on_board?
  end

  def on_board?
    @x && VALID_RANGE.include?(@x) && VALID_RANGE.include?(@y)
  end
end
