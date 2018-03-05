require_relative 'yatzy'
require 'test/unit'

class YatzyTest < Test::Unit::TestCase
  def test_chance
    assert Yatzy.new(2, 3, 4, 5, 1).chance == 15
    assert Yatzy.new(3, 3, 4, 5, 1).chance == 16
  end

  def test_yatzy
    assert Yatzy.new(4, 4, 4, 4, 4).yatzy == 50
    assert Yatzy.new(6, 6, 6, 6, 6).yatzy == 50
    assert Yatzy.new(6, 6, 6, 6, 3).yatzy == 0
  end

  def test_ones
    assert Yatzy.new(1, 2, 3, 4, 5).ones == 1
    assert Yatzy.new(1, 2, 1, 4, 5).ones == 2
    assert Yatzy.new(6, 2, 2, 4, 5).ones == 0
    assert Yatzy.new(1, 2, 1, 1, 1).ones == 4
  end

  def test_twos
    assert Yatzy.new(1, 2, 3, 2, 6).twos == 4
    assert Yatzy.new(2, 2, 2, 2, 2).twos == 10
  end

  def test_threes
    assert Yatzy.new(1, 2, 3, 2, 3).threes == 6
    assert Yatzy.new(2, 3, 3, 3, 3).threes == 12
  end

  def test_fours
    assert Yatzy.new(4, 4, 4, 5, 5).fours == 12
    assert Yatzy.new(4, 4, 5, 5, 5).fours == 8
    assert Yatzy.new(4, 5, 5, 5, 5).fours == 4
  end

  def test_fives
    assert Yatzy.new(4, 4, 4, 5, 5).fives == 10
    assert Yatzy.new(4, 4, 5, 5, 5).fives == 15
    assert Yatzy.new(4, 5, 5, 5, 5).fives == 20
  end

  def test_sixes
    assert Yatzy.new(4, 4, 4, 5, 5).sixes == 0
    assert Yatzy.new(4, 4, 6, 5, 5).sixes == 6
    assert Yatzy.new(6, 5, 6, 6, 5).sixes == 18
  end

  def test_one_pair
    assert Yatzy.one_pair(3, 4, 3, 5, 6) == 6
    assert Yatzy.one_pair(5, 3, 3, 3, 5) == 10
    assert Yatzy.one_pair(5, 3, 6, 6, 5) == 12
  end

  def test_two_pair
    assert_equal 16, Yatzy.two_pair(3, 3, 5, 4, 5)
    assert_equal 16, Yatzy.two_pair(3, 3, 5, 5, 5)
  end

  def test_three_of_a_kind
    assert Yatzy.three_of_a_kind(3, 3, 3, 4, 5) == 9
    assert Yatzy.three_of_a_kind(5, 3, 5, 4, 5) == 15
    assert Yatzy.three_of_a_kind(3, 3, 3, 3, 5) == 9
  end

  def test_four_of_a_knd
    assert Yatzy.four_of_a_kind(3, 3, 3, 3, 5) == 12
    assert Yatzy.four_of_a_kind(5, 5, 5, 4, 5) == 20
    assert Yatzy.four_of_a_kind(3, 3, 3, 3, 3) == 12
  end

  def test_small_straight
    assert Yatzy.small_straight(1, 2, 3, 4, 5) == 15
    assert Yatzy.small_straight(2, 3, 4, 5, 1) == 15
    assert Yatzy.small_straight(1, 2, 2, 4, 5) == 0
  end

  def test_large_straight
    assert Yatzy.large_straight(6, 2, 3, 4, 5) == 20
    assert Yatzy.large_straight(2, 3, 4, 5, 6) == 20
    assert Yatzy.large_straight(1, 2, 2, 4, 5) == 0
  end

  def test_full_house
    assert Yatzy.full_house(6, 2, 2, 2, 6) == 18
    assert Yatzy.full_house(2, 3, 4, 5, 6) == 0
  end
end
