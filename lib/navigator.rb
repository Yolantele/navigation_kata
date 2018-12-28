
GRID = [ # upper right coordinates 5 3 ( x=> 5, y=> 3 )
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0]
]

ROVERS = {
  rover1: ['1 1 E', 'RFRFRFRF'], 
  rover2: ['3 2 N', 'FRRFLLFFRRFLL'],
  rover3: ['0 3 W', 'LLFFFLFLFL']
}

MOVE_BY_UNIT = 1

class Navigator
  attr_reader :grid, :rovers, :x, :y, :o, :explore

  def initialize(rovers = ROVERS, grid = GRID)
    @rovers = rovers
    @grid = grid
    @y = 0
    @x = 0
    @o = ''
    @explore = ''
    @rovers_end_coordinates = []
  end

  def navigation_commands
    @explore
  end

  def setup_for(rover)
    starting_position = ROVERS[rover][0]
    starting_position.gsub!(/\s+/, '')
    @x = starting_position[0].to_i - 1
    @y = starting_position[1].to_i - 1
    @o = starting_position[2]
    @explore = ROVERS[rover][1].split('')
  end

  
  def spin_right
    if    @o == 'N'; @o = 'W'
    elsif @o == 'W'; @o = 'S'
    elsif @o == 'S'; @o = 'E'
    else  @o == 'E'; @o = 'N'
    end
  end
  
  def spin_left 
    if    @o == 'N'; @o = 'E'
    elsif @o == 'E'; @o = 'S'
    elsif @o == 'S'; @o = 'W'
    else  @o == 'W'; @o = 'N'
    end
  end
  
  def move_in(orientation)
    case orientation
    when 'N' then @y += MOVE_BY_UNIT
    when 'S' then @y -= MOVE_BY_UNIT
    when 'W' then @x -= MOVE_BY_UNIT
    when 'E' then @x += MOVE_BY_UNIT
    else raise Error
    end
  end

  def changed_orientation(command)
    case command
    when 'F' then move_in(@o)
    when 'R' then spin_right
    when 'L' then spin_left
    else 'Use R, L, F commands'
    end
  end

end