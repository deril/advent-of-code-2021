require "./spec_helper"
require "../src/day5"

describe Day5 do
  describe "#part1" do
    it "correctly finds overlaps" do
      data = [
        "0,9 -> 5,9",
        "8,0 -> 0,8",
        "9,4 -> 3,4",
        "2,2 -> 2,1",
        "7,0 -> 7,4",
        "6,4 -> 2,0",
        "0,9 -> 2,9",
        "3,4 -> 1,4",
        "0,0 -> 8,8",
        "5,5 -> 8,2",
      ]

      Day5.new(data).part1.should eq(5)
    end
  end

  describe "#part2" do
    it "correctly finds overlaps with all lines" do
      data = [
        "0,9 -> 5,9",
        "8,0 -> 0,8",
        "9,4 -> 3,4",
        "2,2 -> 2,1",
        "7,0 -> 7,4",
        "6,4 -> 2,0",
        "0,9 -> 2,9",
        "3,4 -> 1,4",
        "0,0 -> 8,8",
        "5,5 -> 8,2",
      ]

      Day5.new(data).part2.should eq(12)
    end
  end
end
