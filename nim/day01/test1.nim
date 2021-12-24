import unittest
import main

let testInput = @[199, 200, 208, 210, 200, 207, 240, 269, 260, 263]

test "correctly counts measurment increase":
    check part1(testInput) == 7

test "correctly counts measurment increase for sliding windows":
    check part2(testInput) == 5
