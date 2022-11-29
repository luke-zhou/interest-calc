# frozen_string_literal: true

module Calc
  class Calculator
    attr_accessor :deposit, :rate, :term, :option

    def balance
      calculate_balance(
        @deposit,
        @rate,
        @term.value,
        @option.value(@term)
      ).round
    end

    def calculate_balance(deposit, rate, term_value, option_value)
      if term_value > option_value
        calculate_balance(
          deposit * (1 + rate / 12.0 * option_value),
          rate,
          term_value - option_value,
          option_value
        )
      else
        (deposit * (1 + rate / 12.0 * term_value))
      end
    end

    private :calculate_balance
  end
end
