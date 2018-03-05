class Yatzy
  attr_reader :dice

  def initialize(d1, d2, d3, d4, d5)
    @dice = [d1, d2, d3, d4, d5]
  end

  def chance
    dice.sum
  end

  def yatzy
    return 50 if dice.uniq.length == 1

    0
  end

  def ones
    sum(1)
  end

  def twos
    sum(2)
  end

  def threes
    sum(3)
  end

  def fours
    sum(4)
  end

  def fives
    sum(5)
  end

  def sixes
    sum(6)
  end

  def self.one_pair( d1,  d2,  d3,  d4,  d5)
    counts = [0]*6
    counts[d1-1] += 1
    counts[d2-1] += 1
    counts[d3-1] += 1
    counts[d4-1] += 1
    counts[d5-1] += 1

    at = 0

    (0...6).each do |at|
      if counts[6-at-1] >= 2
        return (6-at)*2
      end
    end


    0
  end

  def self.two_pair( d1,  d2,  d3,  d4,  d5)
    counts = [0]*6
    counts[d1-1] += 1
    counts[d2-1] += 1
    counts[d3-1] += 1
    counts[d4-1] += 1
    counts[d5-1] += 1

    n = 0
    score = 0

    for i in Array 0..5
      if counts[6-i-1] >= 2
        n = n+1
        score += (6-i)
      end
    end

    if n == 2
      return score * 2
    else
      return 0
    end
  end

  def self.four_of_a_kind( _1,  _2,  d3,  d4,  d5)
    tallies = [0]*6
    tallies[_1-1] += 1
    tallies[_2-1] += 1
    tallies[d3-1] += 1
    tallies[d4-1] += 1
    tallies[d5-1] += 1

    for i in (0..6)
      if tallies[i] >= 4
        return (i+1) * 4
      end
    end

    return 0
  end

  def self.three_of_a_kind( d1,  d2,  d3,  d4,  d5)
    t = [0]*6
    t[d1-1] += 1
    t[d2-1] += 1
    t[d3-1] += 1
    t[d4-1] += 1
    t[d5-1] += 1

    for i in [0,1,2,3,4,5]
      if t[i] >= 3
        return (i+1) * 3
      end
    end

    0
  end

  def self.small_straight(d1, d2, d3, d4, d5)
    tallies = [0] * 6
    tallies[d1-1] += 1
    tallies[d2-1] += 1
    tallies[d3-1] += 1
    tallies[d4-1] += 1
    tallies[d5-1] += 1

    (tallies[0] == 1 and
      tallies[1] == 1 and
      tallies[2] == 1 and
      tallies[3] == 1 and
      tallies[4] == 1) ? 15 : 0
  end

  def self.large_straight(d1, d2, d3, d4, d5)
    tallies = [0]*6
    tallies[d1-1] += 1
    tallies[d2-1] += 1
    tallies[d3-1] += 1
    tallies[d4-1] += 1
    tallies[d5-1] += 1

    if tallies[1] == 1 and tallies[2] == 1 and tallies[3] == 1 and tallies[4] == 1 and tallies[5] == 1
      return 20
    end

    0
  end

  def self.full_house(d1, d2, d3, d4, d5)
    tallies = []
    _2 = false
    i = 0
    _2_at = 0
    _3 = false
    _3_at = 0

    tallies = [0]*6
    tallies[d1-1] += 1
    tallies[d2-1] += 1
    tallies[d3-1] += 1
    tallies[d4-1] += 1
    tallies[d5-1] += 1

    for i in Array 0..5
      if tallies[i] == 2
        _2 = true
        _2_at = i+1
      end
    end

    for i in Array 0..5
      if tallies[i] == 3
        _3 = true
        _3_at = i+1
      end
    end

    if _2 and _3
      return _2_at * 2 + _3_at * 3
    else
      return 0
    end
  end

  private

  def sum(match)
    dice.select { |value| value == match }.sum
  end
end
