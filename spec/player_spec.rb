require_relative '../lib/player'

describe Player do
  describe '#initialize' do
    let(:no_parameter) { Player.new }
    let(:one_parameter) { Player.new('Thapa') }
    let(:two_parameter) { Player.new('Thapa', 'X') }
    it "returns 'name' as name and 'mark' as sybol if any parameter not given" do
      expect([no_parameter.name, no_parameter.mark]).to eql(%w[name mark])
    end

    it "returns 'Thapa' as name and 'mark' as sybol if only one parameter given" do
      expect([one_parameter.name, one_parameter.mark]).to eql(%w[Thapa mark])
    end

    it "returns 'Thapa' as name and 'mark' as sybol if only one parameter given" do
      expect([two_parameter.name, two_parameter.mark]).to eql(%w[Thapa X])
    end
  end
end
