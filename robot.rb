class Robot
  VALID_RANGE = [0..4]
  FACINGS = %i(EAST NORTH WEST SOUTH)
  attr_accessor *%i(x y facing current_instruction)
  PLACE_REGEXP = /PLACE ([0-4]),([0-4]),(EAST|NORTH|WEST|SOUTH)/

  def execute(instruction)
    self.current_instruction = instruction
    place
    return unless on_board?
    process_instruction if is_safe?
  end

  private

  def process_instruction
    report || turn || move
  end

  def place
    if current_instruction =~ PLACE_REGEXP
      self.x, self.y, self.facing = $1.to_i, $2.to_i, $3
    end
  end

  def report
    "#{x},#{y},#{facing}" if current_instruction == 'REPORT'
  end

  def turn
    # if current_instruction == 'LEFT'
    #
    # end
      # @facing  FACINGS
  end

  def move

  end

  private
  def is_safe?
    return true unless current_instruction == 'MOVE'
    clone = self.clone
    clone.process_instruction
    clone.alive?
  end

  def alive?
    return true unless on_board?
    VALID_RANGE.include?(@x) && VALID_RANGE.include?(@y)
  end

  def on_board?
    @x
  end
end
