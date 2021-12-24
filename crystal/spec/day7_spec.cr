require "./spec_helper"
require "../src/day7"

describe Day7 do
  describe "#part1" do
    it "correctly finds fish count after 80 days" do
      data = ["16,1,2,0,4,2,7,1,2,14"]

      Day7.new(data).part1.should eq(37)
    end
  end

  describe "#part2" do
    it "correctly finds fish count after 256 days" do
      data = ["16,1,2,0,4,2,7,1,2,14"]

      Day7.new(data).part2.should eq(168)
    end
  end
end
