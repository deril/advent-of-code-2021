class Day4
  alias BoardValue = Int32?
  @input : Array(String)
  @drawn_numbers : Array(Int32)

  getter boards, input, drawn_numbers

  def self.run
    puts "Day 4"
    input = File.read_lines("resource/day4.txt")
    puts new(input).part1
    puts new(input).part2
  end

  def initialize(input : Array(String))
    @boards = [] of Board
    @input = input
    @drawn_numbers = input[0].split(',').map(&.to_i)
    create_boards
  end

  def part1 : Int32
    drawn_numbers.each do |number|
      boards.each do |board|
        board.mark_number(number)

        return number * board.sum if board.fulfilled?
      end
    end
    0
  end

  def part2 : Int32
    last_score = 0
    drawn_numbers.each do |number|
      boards.each do |board|
        board.mark_number(number)

        if board.fulfilled?
          last_score = number * board.sum
        end
      end
      boards.reject!(&.fulfilled?)
    end
    last_score
  end

  private def create_boards
    next_board = [] of Array(BoardValue)
    input.skip(2).each do |row|
      next if row.empty?

      if next_board.size == 5
        @boards << Board.new(next_board)
        next_board = [] of Array(BoardValue)
      end
      next_board << row.split(" ").reject(&.empty?).map(&.to_i.as(BoardValue))
    end
    @boards << Board.new(next_board)
  end

  class Board
    property numbers

    def initialize(@numbers : Array(Array(BoardValue)))
    end

    def mark_number(mark : Int32)
      numbers.each do |values|
        values.map! do |value|
          if value == mark
            nil
          else
            value
          end
        end
      end
      if mark == 16
        # puts self.to_s
      end
    end

    def fulfilled?
      row_fulfilled? || col_fulfilled?
    end

    def sum
      numbers.flatten.compact.sum
    end

    def row_fulfilled?
      numbers.any?(&.compact.empty?)
    end

    def col_fulfilled?
      numbers.transpose.any?(&.compact.empty?)
    end

    def to_s
      numbers.each do |values|
        values.each do |value|
          if value.nil?
            print "X".ljust(4)
          else
            print value.to_s.ljust(4)
          end
        end
        puts
      end
    end
  end
end
