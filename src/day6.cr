class Day6
  @input : Array(Int32)
  getter input, cache

  def self.run
    puts "Day 6"
    input = File.read_lines("resource/day6.txt")
    service = new(input)
    puts service.part1
    puts service.part2
  end

  def initialize(input : Array(String))
    @input = input[0].split(",").map(&.to_i)
    @cache = {} of Int64 => Int64
  end

  def part1 : Int64
    input.sum { |c| calc(80 - c) }
  end

  def part2 : Int64
    input.sum { |c| calc(256 - c) }
  end

  private def calc(t) : Int64
    t = t.to_i64
    if t <= 0
      1.to_i64
    else
      cache.has_key?(t) ? cache[t] :  (cache[t] = calc(t - 7) + calc(t - 9))
    end
  end
end
