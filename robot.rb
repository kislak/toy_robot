# Represent toy robot
class Robot
  VALID_RANGE = (0..4).freeze
  FACINGS = %w[EAST NORTH WEST SOUTH].freeze
  PLACE_REGEXP = /PLACE ([0-4]),([0-4]),(EAST|NORTH|WEST|SOUTH)/.freeze

  attr_reader :instruction
  attr_reader :x, :y, :facing, :output

  def execute(instruction)
    @instruction = instruction

    place_on_board || on_board_actions
  end

  private

  def place_on_board
    return unless instruction =~ PLACE_REGEXP

    last_match = Regexp.last_match
    @x = last_match[1].to_i
    @y = last_match[2].to_i
    @facing = last_match[3]
  end

  def on_board_actions
    return unless on_board?

    report || turn_left || turn_right || (move if safe_to_move?)
  end

  def report
    "#{x},#{y},#{facing}" if instruction == 'REPORT'
  end

  def turn_left
    return unless instruction == 'LEFT'

    @facing = FACINGS[FACINGS.index(facing) - 4 + 1]
  end

  def turn_right
    return unless instruction == 'RIGHT'

    @facing = FACINGS[FACINGS.index(facing) - 1]
  end

  def safe_to_move?
    imaginary.move
    imaginary.on_board?
  end

  def imaginary
    @imaginary ||= clone
  end

  protected

  def on_board?
    VALID_RANGE.include?(x) && VALID_RANGE.include?(y)
  end

  def move
    return unless instruction == 'MOVE'

    @y += 1 if facing == FACINGS[1]
    @y -= 1 if facing == FACINGS[3]
    @x += 1 if facing == FACINGS[0]
    @x -= 1 if facing == FACINGS[2]
  end
end
