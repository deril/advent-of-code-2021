require "./spec_helper"
require "../src/day6"

describe Day6 do
  describe "#part1" do
    it "correctly finds fish count after 80 days" do
      data = ["3,4,3,1,2"]

      Day6.new(data).part1.should eq(5934)
    end
  end

  describe "#part2" do
    it "correctly finds fish count after 256 days" do
      data = ["3,4,3,1,2"]

      Day6.new(data).part2.should eq(26984457539)
    end
  end
end
