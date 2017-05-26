require 'test_helper'

class BetTest < ActiveSupport::TestCase

  test "result is not available" do
    bet = (Bet.includes(match: :match_result)
              .where(match_results: {id: nil})
              .first)
    assert_not bet.is_result_available
  end

  test "result is available" do
    bet = (Bet.includes(match: :match_result)
              .where
              .not(match_results: {id: nil})
              .first)
    assert bet.is_result_available
  end

  test "user won bet" do
    bet = (Bet.includes(match: :match_result)
              .where
              .not(match_results: {id: nil})
              .first)
    assert bet.user_won_bet
  end

  test "user did not win bet" do
    bet = (Bet.includes(match: :match_result)
              .where(match_results: {id: nil})
              .first)
    assert_not bet.user_won_bet
  end
end
