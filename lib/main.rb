# frozen_string_literal: true

puts 'Let us start:'
puts 'Please input deposit amount:'
input = gets.strip
deposit = input.to_f
puts 'Please input interest rate:'
input = gets.strip
rate = input.to_f
puts 'Please input investment term:'
input = gets.strip
term = Calc::Term.parse(input)
puts 'Please input interest paid option (Monthly, Quarterly, Annually, Maturity):'
input = gets.strip
option = Calc::Option.parse(input)
