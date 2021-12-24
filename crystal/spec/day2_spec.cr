require "./spec_helper"
require "../src/day2"

describe Day2 do
  describe "#part1" do
    it "correctly determines final position" do
      data = [
        "forward 5",
        "down 5",
        "forward 8",
        "up 3",
        "down 8",
        "forward 2",
      ]

      Day2.part1(data).should eq(150)
    end
  end

  describe "#part2" do
    data = [
      "forward 5",
      "down 5",
      "forward 8",
      "up 3",
      "down 8",
      "forward 2",
    ]

    Day2.part2(data).should eq(900)
  end
end
