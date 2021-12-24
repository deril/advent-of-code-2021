module Day2
  extend self

  struct Point
    property x, y

    def initialize(@x : Int32, @y : Int32)
    end
  end

  struct PointWithAim
    property x, y, aim

    def initialize
      @x = 0
      @y = 0
      @aim = 0
    end
  end

  def run
    puts "Day 2"
    input = File.read_lines("resource/day2.txt")
    puts part1(input)
    puts part2(input)
  end

  def part1(input : Array(String)) : Int32
    position = Point.new(0, 0)
    input.each do |command|
      direction, amount = command.split(" ")

      case direction
      when "forward"
        position.x += amount.to_i
      when "down"
        position.y += amount.to_i
      when "up"
        position.y -= amount.to_i
      end
    end

    position.x * position.y
  end

  def part2(input : Array(String)) : Int32
    position = PointWithAim.new

    input.each do |command|
      direction, amount = command.split(" ")
      amount = amount.to_i

      case direction
      when "forward"
        position.x += amount
        position.y += position.aim * amount
      when "down"
        position.aim += amount
      when "up"
        position.aim -= amount
      end
    end

    position.x * position.y
  end
end
