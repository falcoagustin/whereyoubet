require 'test_helper'

class CompleteBetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "user won complete bet" do
    complete_bet = (CompleteBet.joins(:first_bet)
                               .where('bets.bet_on_local' => true)
                               .first)
    assert complete_bet.user_won_complete_bet
  end

  test "user did not win complete bet" do
    complete_bet = (CompleteBet.joins(:first_bet)
                               .where('bets.bet_on_visitor' => true)
                               .first)
    assert_not complete_bet.user_won_complete_bet
  end

  test "user made two bets and lost complete bet" do
   complete_bet = (CompleteBet.where
                              .not(first_bet_id: nil, second_bet_id: nil)
                              .first)
   assert_not complete_bet.user_won_complete_bet
  end

  test "user made three bets and lost complete bet" do
    complete_bet = (CompleteBet.where(third_bet_id: nil)
                               .where.not(first_bet_id: nil, second_bet_id: nil)
                               .first)
    assert_not complete_bet.user_won_complete_bet
  end

  test "failed sending e-mail to user when betting" do
    # Testing user sent mail correctly would be testing rails mailers.
    complete_bet = CompleteBet.first
    UserMailer.expects(:finished_bet_email).returns(true)
    assert_equal complete_bet.send_email, UserMailer::ERROR_MESSAGE
  end
end
