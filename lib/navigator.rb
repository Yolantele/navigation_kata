
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

end