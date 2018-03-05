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

  def one_pair
    find_pairs.max.to_i * 2
  end

  def two_pair
    find_pairs(2).max(2).map { |die| die * 2 }.sum
  end

  def three_of_a_kind
    of_a_kind(3)
  end

  def four_of_a_kind
    of_a_kind(4)
  end

  def small_straight
    return 0 if dice.include?(6) || dice.uniq.size != dice.size

    15
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

  def find_pairs(count = 1)
    pairs = matches(2).keys

    return [] unless pairs.size >= count

    pairs
  end

  def find_triples
    matches(3)
  end

  def matches(threshold)
    dice.group_by { |die| die }.select do |_, value|
      value.size >= threshold
    end
  end

  def of_a_kind(value)
    match = matches(value).values

    return 0 unless match.any?

    match.first.first(value).sum
  end
end
