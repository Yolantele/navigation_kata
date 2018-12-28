require 'navigator'

describe Navigator do
  let(:navigator) { described_class.new }

  describe ' #initialize' do
    it ' is an instance of Navigator' do
      expect(navigator).to be_an_instance_of(Navigator)
    end
  end

end