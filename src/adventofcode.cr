require "./day1"
require "./day2"

module Adventofcode
  extend self

  def run
    puts "Day 1"
    day1_input = File.read_lines("resource/day1.txt")
    puts Day1.part1(day1_input)
    puts Day1.part2(day1_input)

    puts "Day 2"
    day2_input = File.read_lines("resource/day2.txt")
    puts Day2.part1(day2_input)
    puts Day2.part2(day2_input)
  end
end

Adventofcode.run
