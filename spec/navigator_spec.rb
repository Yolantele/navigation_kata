require 'navigator'

describe Navigator do
let(:navigator) { described_class.new }

describe ' #initialize' do
  it ' is an instance of Navigator' do
    expect(navigator).to be_an_instance_of(Navigator)
  end
end

describe ' #setup_for' do
  it ' translates string into array of command strings ' do
    navigator.setup_for(:rover1)
    expect(navigator.x).to eq(0)
    expect(navigator.y).to eq(0)
    expect(navigator.o).to eq('E')
    command = ['R', 'F', 'R', 'F', 'R', 'F', 'R', 'F']
    expect(navigator.explore).to eq(command)
  end
  it ' translates string into array of command strings ' do
    navigator.setup_for(:rover2)
    expect(navigator.x).to eq(2)
    expect(navigator.y).to eq(1)
    expect(navigator.o).to eq('N')
    command = ['F', 'R', 'R', 'F', 'L', 'L', 'F', 'F', 'R', 'R', 'F', 'L', 'L']
    expect(navigator.explore).to eq(command)
  end
end

  describe ' #move_in' do
    context ' can be facing 4 directions' do
      it ' goes down 1 array but up/north in the grid, when given N' do
        navigator.move_in('N')
        expect(navigator.y).to eq(1)
      end
      it ' goes up 1 array, but down/south the grid, when given S' do
        navigator.move_in('S')
        expect(navigator.y).to eq(-1)
      end
      it ' goes left inside array but right/west on the grid, when given W' do
        navigator.move_in('W')
        expect(navigator.x).to eq(-1)
      end
      it ' goes right inside array but left/east on the grid, when given E' do
        navigator.move_in('E')
        expect(navigator.x).to eq(1)
      end
    end
  end
  describe ' #changed_orientation' do
    context ' when command is  L - it spins left by 90 degrees' do
      it ' changes orientation to South' do
        navigator.setup_for(:rover1)
        navigator.changed_orientation('L')
        expect(navigator.o).to eq('S')
      end
    end
    context ' when command is R - it spins right by 90 degrees' do
      it ' changes orientation to North)' do
        navigator.setup_for(:rover1)
        navigator.changed_orientation('R')
        expect(navigator.o).to eq('N')
      end
    end
    context ' when command is F - it moves in previously set direction' do
      it ' keeps moving in East orientation' do
        navigator.setup_for(:rover1)
        navigator.changed_orientation('F')
        expect(navigator.o).to eq('E')
        expect(navigator.y).to eq(0)
      end
    end
  end

  describe ' #navigate(rover)' do
    it 'goes through all the exploration commands' do
      navigator.navigate(:rover2)
      expect(navigator.x).to eq(2)
      expect(navigator.y).to eq(2)
      expect(navigator.o).to eq('N')
    end
  end

  describe ' #rovers_report' do
    it 'returns all rover end coordinates' do
      expect(navigator.rovers_report).to eq(['1 1 E', '3 3 N', '2 3 S'])
    end
  end

end