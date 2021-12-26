import strutils

proc part1*(input: seq[string]): int =
    ## [x, y]
    var coordinates: array[2, int] = [0, 0]
    for command in input:
        let 
            commandArray = command.split()
            action = commandArray[0]
            num = parseInt commandArray[1]
        case action
        of "forward":
            coordinates[0] += num
        of "down":
            coordinates[1] += num
        of "up":
            coordinates[1] -= num
    coordinates[0] * coordinates[1]

proc part2*(input: seq[string]): int =
    ## [x, y, aim]
    var coordinates: array[3, int] = [0, 0, 0]
    for command in input:
        let
            commandArray = command.split()
            action = commandArray[0]
            num = parseInt commandArray[1]
        case action
        of "forward":
            coordinates[0] += num
            coordinates[1] += coordinates[2] * num
        of "down":
            coordinates[2] += num
        of "up":
            coordinates[2] -= num
    coordinates[0] * coordinates[1]

when isMainModule:
    let commands = readFile("../resources/day2.txt").strip().splitLines()
    echo part1(commands)
    echo part2(commands)