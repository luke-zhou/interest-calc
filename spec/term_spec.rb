# frozen_string_literal: true

describe Calc::Term do
  describe '#parse' do
    it 'parse valid input' do
      expect(Calc::Term.parse('1 month').num).to eq(1)
      expect(Calc::Term.parse('1 month').unit).to eq(:month)
      expect(Calc::Term.parse('2 quarters').num).to eq(2)
      expect(Calc::Term.parse('2 quarters').unit).to eq(:quarter)
      expect(Calc::Term.parse('3 years').num).to eq(3)
      expect(Calc::Term.parse('3 years').unit).to eq(:year)
    end

    it 'parse invalid input' do
      expect { Calc::Term.parse('1 blah') }.to raise_error 'Invalid Term'
      expect { Calc::Term.parse('one year') }.to raise_error 'Invalid Term'
      expect { Calc::Term.parse('2years') }.to raise_error 'Invalid Term'
    end
  end

  describe '#value' do
    it 'returns correct value of months' do
      expect(Calc::Term.new(3, :month).value).to eq(3)
      expect(Calc::Term.new(2, :quarter).value).to eq(6)
      expect(Calc::Term.new(1, :year).value).to eq(12)
    end
  end
end
