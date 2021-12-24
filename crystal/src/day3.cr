module Day3
  extend self

  def run
    puts "Day 3"
    input = File.read_lines("resource/day3.txt")
    puts part1(input)
    puts part2(input)
  end

  def part1(input : Array(String)) : Int32
    gamma_rate_builder = String::Builder.new
    i = input[0].size - 1
    while i >= 0
      gamma_rate_builder << most_common_byte(input, i)
      i -= 1
    end
    gamma_rate_string = gamma_rate_builder.to_s.reverse
    gamma_rate = gamma_rate_string.to_i(2)
    epsilon_rate = gamma_rate_string.chars.map { |c| c == '1' ? '0' : '1' }.join.to_i(2)
    gamma_rate * epsilon_rate
  end

  def part2(input : Array(String)) : Int32
    filtered = input

    input[0].size.times do |i|
      break if filtered.size == 1
      bit_to_add = most_common_byte_ox(filtered, i)
      filtered = filtered.select { |el| el[i] == bit_to_add }
    end
    ox = filtered[0].to_i(2)

    filtered = input

    input[0].size.times do |i|
      break if filtered.size == 1
      bit_to_add = least_common_byte_co2(filtered, i)
      filtered = filtered.select { |el| el[i] == bit_to_add }
    end
    co2 = filtered[0].to_i(2)

    ox * co2
  end

  private def most_common_byte(list : Array(String), position : Int32) : Char
    column = list.map { |el| el[position] }
    column.count('1') > column.count('0') ? '1' : '0'
  end

  private def most_common_byte_ox(list : Array(String), position : Int32) : Char
    column = list.map { |el| el[position] }
    column.count('1') >= column.count('0') ? '1' : '0'
  end

  private def least_common_byte_co2(list : Array(String), position : Int32) : Char
    column = list.map { |el| el[position] }
    column.count('1') >= column.count('0') ? '0' : '1'
  end
end
