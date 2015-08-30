class Robot
  VALID_RANGE = [0..4]
  FACINGS = %w(EAST NORTH WEST SOUTH)
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
    self.facing = FACINGS[FACINGS.index(facing) - 4 + 1] if current_instruction == 'LEFT'
    self.facing = FACINGS[FACINGS.index(facing) - 1] if current_instruction == 'RIGHT'
  end

  def move
    if current_instruction == 'MOVE'
      self.x += 1 if self.facing == FACINGS[1]
      self.x -= 1 if self.facing == FACINGS[3]
      self.y += 1 if self.facing == FACINGS[0]
      self.y -= 1 if self.facing == FACINGS[2]
    end
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
