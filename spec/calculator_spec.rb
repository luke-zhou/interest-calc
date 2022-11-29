# frozen_string_literal: true

describe Calc::Calculator do
  describe '#balance' do
    let(:calculator) { Calc::Calculator.new }
    it 'gets the correct balance - 1' do
      calculator.deposit = 10_000
      calculator.rate = 0.011
      calculator.term = Calc::Term.new(3, :year)
      calculator.option = Calc::Option.new(:Maturity)
      expect(calculator.balance).to eq(10_330)
    end
    it 'gets the correct balance - 2' do
      calculator.deposit = 10_000
      calculator.rate = 0.011
      calculator.term = Calc::Term.new(3, :year)
      calculator.option = Calc::Option.new(:Annually)
      expect(calculator.balance).to eq(10_334)
    end
    it 'gets the correct balance - 3' do
      calculator.deposit = 10_000
      calculator.rate = 0.011
      calculator.term = Calc::Term.new(3, :year)
      calculator.option = Calc::Option.new(:Quarterly)
      expect(calculator.balance).to eq(10_335)
    end
    it 'gets the correct balance - 3' do
      calculator.deposit = 10_000
      calculator.rate = 0.011
      calculator.term = Calc::Term.new(3, :year)
      calculator.option = Calc::Option.new(:Monthly)
      expect(calculator.balance).to eq(10_335)
    end
  end
end
