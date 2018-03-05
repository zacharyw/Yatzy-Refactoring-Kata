class Yatzy
  attr_reader :dice

  def initialize(d1, d2, d3, d4, d5 = nil)
    @dice = [d1, d2, d3, d4, d5].compact
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
    find_pairs.keys.max.to_i * 2
  end

  def two_pair
    pairs = find_pairs

    return 0 if pairs.values.sum < 2

    keys =  pairs.keys.sort.reverse

    score = 0

    keys.each do |key|
      pair_count = pairs[key]

      score += key * (2 * pair_count)

      break if pair_count > 1
    end

    score
  end

  def three_of_a_kind
    of_a_kind(3)
  end

  def four_of_a_kind
    of_a_kind(4)
  end

  def small_straight
    return 15 if !dice.include?(6) && unique? && dice.size == 5

    0
  end

  def large_straight
    return 20 if dice.include?(6) && unique? && dice.size == 5

    0
  end

  def full_house
    groups = dice.group_by { |die| die }

    counts = groups.transform_values(&:size).values

    return dice.sum if counts.include?(2) && counts.include?(3)

    0
  end

  private

  # Sum dice with values matching the given match
  def sum(match)
    dice.select { |value| value == match }.sum
  end

  # Return map of dice values and the number of pairs each value has
  # Ex: { 3 => 1, 2 => 1 } is one pair of threes and one pair of twos
  def find_pairs
    pairs = matches(2)

    pairs.transform_values do |value|
      value.size / 2
    end
  end

  # Return map keyed on dice numbers. Map values are individual rolls for that
  # die.
  #
  # Map only includes values for dice that rolled values greater than or equal
  # to given threshold.
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

  # Checks if each die value is different.
  def unique?
    dice.uniq.size == dice.size
  end
end
