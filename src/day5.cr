class Day5
  COORDS_REGEX = /(?<x1>\d+),(?<y1>\d+) -> (?<x2>\d+),(?<y2>\d+)/

  @parsed_input : Array(Array(Point))

  getter field, parsed_input

  def self.run
    puts "Day 5"
    input = File.read_lines("resource/day5.txt")
    service = new(input)
    puts service.part1
    puts service.part2
  end

  def initialize(@input : Array(String))
    @parsed_input = parse(@input)
    @field = {} of Array(Int32) => Int32
  end

  def part1 : Int32
    field.clear
    parsed_input.each do |line|
      x1 = line[0].x
      y1 = line[0].y
      x2 = line[1].x
      y2 = line[1].y

      if x1 == x2
        ([y1, y2].min..[y1, y2].max).each do |i|
          mark x1, i
        end
      elsif y1 == y2
        ([x1, x2].min..[x1, x2].max).each do |i|
          mark i, y1
        end
      end
    end

    field.values.count { |x| x > 1 }
  end

  def part2 : Int32
    field.clear
    parsed_input.each do |line|
      x1 = line[0].x
      y1 = line[0].y
      x2 = line[1].x
      y2 = line[1].y

      if x1 == x2
        ([y1, y2].min..[y1, y2].max).each do |i|
          mark x1, i
        end
      elsif y1 == y2
        ([x1, x2].min..[x1, x2].max).each do |i|
          mark i, y1
        end
      else
        xd = x1 > x2 ? -1 : 1
        yd = y1 > y2 ? -1 : 1
        xx = x1
        yy = y1
        while xx != x2
          mark xx, yy
          xx += xd
          yy += yd
        end
        # one extra
        mark xx, yy
      end
    end

    field.values.count { |x| x > 1 }
  end

  private def parse(input) : Array(Array(Point))
    input.map do |entry|
      match_data = COORDS_REGEX.match(entry)
      x1 = match_data.try(&.["x1"].to_i) || 0
      y1 = match_data.try(&.["y1"].to_i) || 0
      x2 = match_data.try(&.["x2"].to_i) || 0
      y2 = match_data.try(&.["y2"].to_i) || 0

      [
        Point.new(x1, y1),
        Point.new(x2, y2)
      ]
    end
  end

  private def mark(x, y)
    field[[x, y]] = field.fetch([x, y], 0) + 1
  end

  struct Point
    property x, y

    def initialize(@x : Int32, @y : Int32)
    end
  end
end
