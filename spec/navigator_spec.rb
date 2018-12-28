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

end