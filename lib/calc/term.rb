# frozen_string_literal: true

module Calc
  class Term
    attr_reader :num, :unit

    INPUT_REGX = /^(\d)*\s+(month|quarter|year|)s?$/.freeze

    def initialize(num, unit)
      @num = num.to_i
      @unit = unit.to_sym
    end

    def self.parse(input_string)
      m = input_string.match INPUT_REGX
      raise 'Invalid Term' unless m

      Calc::Term.new(m[1], m[2])
    end

    def value
      case @unit
      when :month
        @num
      when :quarter
        @num * 3
      when :year
        @num * 12
      end
    end
  end
end
