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
    return 15 if !dice.include?(6) && unique?

    0
  end

  def large_straight
    return 20 if dice.include?(6) && unique?

    0
  end

  def full_house
    return dice.sum if one_pair > 0 && three_of_a_kind > 0

    0
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

  def unique?
    dice.uniq.size == dice.size
  end
end
