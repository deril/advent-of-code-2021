require "./spec_helper"
require "../src/day1"

describe Day1 do
  describe "#part1" do
    it "correctly counts measurment increase" do
      data = %w[ 199 200 208 210 200 207 240 269 260 263 ]

      Day1.part1(data).should eq(7)
    end
  end

  describe "#part2" do
    it "correctly counts measurment increase for sliding windows" do
      data = %w[ 199 200 208 210 200 207 240 269 260 263 ]

      Day1.part2(data).should eq(5)
    end
  end
end
