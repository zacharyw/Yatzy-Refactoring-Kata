require_relative 'yatzy'
require 'test/unit'

class YatzyTest < Test::Unit::TestCase
  def test_chance
    assert_equal 15, Yatzy.new(2, 3, 4, 5, 1).chance
    assert_equal 16, Yatzy.new(3, 3, 4, 5, 1).chance
  end

  def test_yatzy
    assert_equal 50, Yatzy.new(4, 4, 4, 4, 4).yatzy
    assert_equal 50, Yatzy.new(6, 6, 6, 6, 6).yatzy
    assert_equal 0, Yatzy.new(6, 6, 6, 6, 3).yatzy
  end

  def test_ones
    assert_equal 1, Yatzy.new(1, 2, 3, 4, 5).ones
    assert_equal 2, Yatzy.new(1, 2, 1, 4, 5).ones
    assert_equal 0, Yatzy.new(6, 2, 2, 4, 5).ones
    assert_equal 4, Yatzy.new(1, 2, 1, 1, 1).ones
  end

  def test_twos
    assert_equal 4, Yatzy.new(1, 2, 3, 2, 6).twos
    assert_equal 10, Yatzy.new(2, 2, 2, 2, 2).twos
  end

  def test_threes
    assert_equal 6, Yatzy.new(1, 2, 3, 2, 3).threes
    assert_equal 12, Yatzy.new(2, 3, 3, 3, 3).threes
  end

  def test_fours
    assert_equal 12, Yatzy.new(4, 4, 4, 5, 5).fours
    assert_equal 8, Yatzy.new(4, 4, 5, 5, 5).fours
    assert_equal 4, Yatzy.new(4, 5, 5, 5, 5).fours
  end

  def test_fives
    assert_equal 10, Yatzy.new(4, 4, 4, 5, 5).fives
    assert_equal 15, Yatzy.new(4, 4, 5, 5, 5).fives
    assert_equal 20, Yatzy.new(4, 5, 5, 5, 5).fives
  end

  def test_sixes
    assert_equal 0, Yatzy.new(4, 4, 4, 5, 5).sixes
    assert_equal 6, Yatzy.new(4, 4, 6, 5, 5).sixes
    assert_equal 18, Yatzy.new(6, 5, 6, 6, 5).sixes
  end

  def test_one_pair
    assert_equal 6, Yatzy.new(3, 4, 3, 5, 6).one_pair
    assert_equal 10, Yatzy.new(5, 3, 3, 3, 5).one_pair
    assert_equal 12, Yatzy.new(6, 6, 6, 6, 6).one_pair
    assert_equal 12, Yatzy.new(5, 3, 6, 6, 5).one_pair
    assert_equal 0, Yatzy.new(1, 2, 3, 4, 5).one_pair
  end

  def test_two_pair
    assert_equal 16, Yatzy.new(3, 3, 5, 4, 5).two_pair
    assert_equal 16, Yatzy.new(3, 3, 5, 5, 5).two_pair
    assert_equal 0, Yatzy.new(3, 3, 1, 2, 4).two_pair
  end

  def test_three_of_a_kind
    assert_equal 9, Yatzy.new(3, 3, 3, 4, 5).three_of_a_kind
    assert_equal 15, Yatzy.new(5, 3, 5, 4, 5).three_of_a_kind
    assert_equal 9, Yatzy.new(3, 3, 3, 3, 5).three_of_a_kind
    assert_equal 0, Yatzy.new(3, 3, 2, 2, 6).three_of_a_kind
  end

  def test_four_of_a_kind
    assert_equal 12, Yatzy.new(3, 3, 3, 3, 5).four_of_a_kind
    assert_equal 20, Yatzy.new(5, 5, 5, 4, 5).four_of_a_kind
    assert_equal 12, Yatzy.new(3, 3, 3, 3, 3).four_of_a_kind
    assert_equal 0, Yatzy.new(3, 3, 3, 2, 2).four_of_a_kind
  end

  def test_small_straight
    assert_equal 15, Yatzy.small_straight(1, 2, 3, 4, 5)
    assert_equal 15, Yatzy.small_straight(2, 3, 4, 5, 1)
    assert_equal 0, Yatzy.small_straight(1, 2, 2, 4, 5)
  end

  def test_large_straight
    assert_equal 20, Yatzy.large_straight(6, 2, 3, 4, 5)
    assert_equal 20, Yatzy.large_straight(2, 3, 4, 5, 6)
    assert_equal 0, Yatzy.large_straight(1, 2, 2, 4, 5)
  end

  def test_full_house
    assert_equal 18, Yatzy.full_house(6, 2, 2, 2, 6)
    assert_equal 0, Yatzy.full_house(2, 3, 4, 5, 6)
  end
end
