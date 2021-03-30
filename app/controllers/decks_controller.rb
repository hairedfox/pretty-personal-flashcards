# frozen_string_literal: true

class DecksController < BaseController
  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(deck_params)
    @deck.user_id = current_user.id

    if @deck.save
      redirect_to root_url, notice: 'Deck was created successfully'
    else
      render :new
    end
  end

  private

  def deck_params
    params.require(:deck).permit(:name, :cover)
  end
end
