# new
class BowlingScore
  attr_reader :score, :first_total, :second_total

  def initialize
    @score = 0
  end

  def invalid_rolls(roll1, roll2)
    roll1 + roll2 > 10
  end

  def negative_rolls(roll1, roll2)
    roll1 < 0 || roll2 < 0
  end

  def first_frame(roll1, roll2)
    fail 'there are only 10 pins to hit!' if invalid_rolls(roll1, roll2)
    fail 'no negative rolls allowed' if negative_rolls(roll1, roll2)
    @first_total = roll1 + roll2
    @score = score + first_total
  end

  def first_spare?
    first_total == 10
  end

  def first_spare_extra
    extra == 0 unless first_spare?
  end

  def second_frame(roll1, roll2)
    fail 'there are only 10 pins to hit!' if invalid_rolls(roll1, roll2)
    fail 'no negative rolls allowed' if negative_rolls(roll1, roll2)
    second_total = roll1 + roll2 + second_extra(roll1, roll2)
    @score = score + second_total
  end

  def second_spare?
    second_total == 10
  end

  def second_extra(roll1, _roll2)
    first_spare? ? extra = roll1 : extra = 0
    extra
  end

  def second_spare_extra
    extra == 0 unless second_total?
  end

  def third_frame(roll1, roll2)
    fail 'there are only 10 pins to hit!' if invalid_rolls(roll1, roll2)
    fail 'no negative rolls allowed' if negative_rolls(roll1, roll2)
    third_total = roll1 + roll2 + third_extra(roll1, roll2)
    @score = score + third_total
  end

  def third_extra(roll1, _roll2)
    second_spare? ? extra = roll1 : extra = 0
    extra
  end
end

bs = BowlingScore.new
puts bs.score

bs.first_frame(10, 0)
puts bs.score

bs.second_frame(2, 1)

puts "second frame score is #{bs.score}"

bs.third_frame(2, 1)
puts bs.score
puts "third frame score is #{bs.score}"