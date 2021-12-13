require "./spec_helper"
require "../src/day3"

describe Day3 do
  describe "#part1" do
    it "correctly determines power consumption" do
      data = [
        "00100",
        "11110",
        "10110",
        "10111",
        "10101",
        "01111",
        "00111",
        "11100",
        "10000",
        "11001",
        "00010",
        "01010"
      ]

      Day3.part1(data).should eq(198)
    end
  end

  describe "#part2" do
    it "correctly determines life support rating" do
      data = [
        "00100",
        "11110",
        "10110",
        "10111",
        "10101",
        "01111",
        "00111",
        "11100",
        "10000",
        "11001",
        "00010",
        "01010"
      ]

      Day3.part2(data).should eq(230)
    end
  end
end
