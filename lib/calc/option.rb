# frozen_string_literal: true

module Calc
  class Option
    attr_reader :option

    INPUT_REGX = /^(Monthly|Quarterly|Annually|Maturity)$/.freeze

    def initialize(option)
      @option = option.to_sym
    end

    def self.parse(input_string)
      m = input_string.match INPUT_REGX
      raise 'Invalid Option' unless m

      Calc::Option.new(m[1])
    end

    def value(term)
      case @option
      when :Monthly
        1
      when :Quarterly
        3
      when :Annually
        12
      when :Maturity
        term.value
      end
    end
  end
end
