class CompleteBetsController < ApplicationController
  before_action :user_signed_in?, :authenticate_user!

  def create
    byebug
    complete_bet_params
    bet_object = params[:completeBet]
    amount = bet_object[:amount]
    bet_object = bet_object.except(:amount)
    if bet_object.empty? || amount.nil?
      redirect_to :back
    else
      validate_bets(bet_object)
      @complete_bet = CompleteBet.new(
        :first_bet => @first_bet,
        :second_bet => @second_bet,
        :third_bet => @third_bet,
        :amount => bet_object[:amount]
      )
      if @complete_bet.save
        redirect_to :back
      end
    end
  end

  private
    def validate_bets(bet_object)
      now = DateTime.now
      if bet_object[:id1]
        @first_bet = Bet.new(
          :match_id => bet_object[:id1],
          bet_object[:select1] => true,
          :user_id => current_user.id,
          :executed => now
        )
        @first_bet.save
      end
      if bet_object[:id2]
        @second_bet = Bet.new(
          :match_id => bet_object[:id2],
          bet_object[:select2] => true,
          :user_id => current_user.id,
          :executed => now
        )
        @second_bet.save
      end
      if bet_object[:id3]
        @third_bet = Bet.new(
          :match_id => bet_object[:id3],
          bet_object[:select3] => true,
          :user_id => current_user.id,
          :executed => now
        )
        @third_bet.save
      end
      #return @first_bet, @second_bet, @third_bet
    end
    def complete_bet_params
      params.require(:completeBet).permit(
        :id1, :id2, :id3, :select1, :select2, :select3
      )
    end
end
