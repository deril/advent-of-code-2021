import unittest
import main

let testInput = @[
        "forward 5",
        "down 5",
        "forward 8",
        "up 3",
        "down 8",
        "forward 2",
    ]

test "correctly determines final position":
    check part1(testInput) == 150

test "correctly determines final position with aim":
    check part2(testInput) == 900
