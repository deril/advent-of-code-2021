import std/strutils, std/sequtils

const resource = staticRead"../resources/day1.txt"

proc part1*(depths: seq[int]): int =
    for i in 1..<depths.len:
        if depths[i-1] < depths[i]:
            result += 1

proc part2*(depths: seq[int]): int =
    let window = 3
    for i in window..<depths.len:
        if depths[i-window] < depths[i]:
            result += 1

when isMainModule:
    let depths = resource.splitLines.filter(proc(x: string): bool = not isEmptyOrWhitespace(x)).map parseInt
    echo part1(depths)
    echo part2(depths)
