class Day7
  @input : Array(Int32)
  getter input

  def self.run
    puts "Day 7"
    input = File.read_lines("resource/day7.txt")
    service = new(input)
    puts service.part1
    puts service.part2
  end

  def initialize(input : Array(String))
    @input = input[0].split(",").map(&.to_i)
  end

  def part1 : Int32
    (0..input.max).map { |u| input.sum { |x| (x - u).abs } }.min
  end

  def part2 : Int32
    (0..input.max).map { |u| input.sum { |x| n = (x - u).abs; (n * (n + 1)) / 2 } }.min.to_i
  end
end
