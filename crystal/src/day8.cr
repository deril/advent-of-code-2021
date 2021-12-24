class Day8
  getter input

  def self.run
    puts "Day 8"
    input = File.read_lines("resource/day8.txt")
    service = new(input)
    puts service.part1
    puts service.part2
  end

  def initialize(@input : Array(String))
  end

  def part1 : Int32
    tokens = [2, 3, 4, 7]
    input.flat_map(&.split(" | ").last.split(" ")).count { |n| tokens.includes?(n.size) }
  end

  def part2 : Int32
    data = input.map do |line|
      sides = line.split(" | ")
      {
        input:  sides[0].split(" ").map(&.chars.sort!),
        output: sides[1].split(" ").map(&.chars.sort!),
      }
    end

    data.sum do |line|
      decoded = decode line[:input]
      line[:output].map { |num| decoded.index(num) }.join.to_i
    end
  end

  private def decode(input)
    default_value = Array(Char).new
    one = input.find { |num| num.size == 2 } || default_value
    four = input.find { |num| num.size == 4 } || default_value
    seven = input.find { |num| num.size == 3 } || default_value
    eight = input.find { |num| num.size == 7 } || default_value
    nine = input.find { |num| num.size == 6 && (num - four - seven).size == 1 } || default_value
    six = input.find { |num| num.size == 6 && (one - num).size == 1 } || default_value
    zero = input.find { |num| num.size == 6 && num != six && num != nine } || default_value
    five = input.find { |num| num.size == 5 && (six - num).size == 1 } || default_value
    three = input.find { |num| num.size == 5 && num != five && (num - nine).size == 0 && (nine - num).size == 1 } || default_value
    two = input.find { |num| num.size == 5 && num != three && num != five } || default_value

    [zero, one, two, three, four, five, six, seven, eight, nine]
  end
end
