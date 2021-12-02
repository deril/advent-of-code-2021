module Day1
  extend self

  def part1(input : Array(String)) : Int32
    input.map(&.to_i32).each_cons(2).count do |(first, second)|
      second > first
    end
  end

  def part2(input : Array(String)) : Int32
    input.map(&.to_i32).each_cons(3).to_a
      .each_cons(2).count do |(first, second)|
      second.sum > first.sum
    end
  end
end
