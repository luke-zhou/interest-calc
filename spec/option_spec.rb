# frozen_string_literal: true

describe Calc::Option do
  describe '#parse' do
    it 'parse valid input' do
      expect(Calc::Option.parse('Monthly').option).to eq(:Monthly)
      expect(Calc::Option.parse('Quarterly').option).to eq(:Quarterly)
      expect(Calc::Option.parse('Annually').option).to eq(:Annually)
      expect(Calc::Option.parse('Maturity').option).to eq(:Maturity)
    end

    it 'parse invalid input' do
      expect { Calc::Option.parse('blahblah') }.to raise_error 'Invalid Option'
    end
  end

  describe '#value' do
    it 'returns correct value of months' do
      term = Calc::Term.new(20, :year)
      expect(Calc::Option.new(:Monthly).value(term)).to eq(1)
      expect(Calc::Option.new(:Quarterly).value(term)).to eq(3)
      expect(Calc::Option.new(:Annually).value(term)).to eq(12)
      expect(Calc::Option.new(:Maturity).value(term)).to eq(240)
    end
  end
end
