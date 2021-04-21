# frozen_string_literal: true

class DecksController < ApplicationController
  def index
    @decks = Deck.with_deleted
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = current_user.decks.build(deck_params)
    if @deck.save
      flash[:success] = t('.succeeded')
      redirect_to root_url
    else
      flash[:danger] = t('.failed')
      render :new
    end
  end

  private

  def deck_params
    params.require(:deck).permit(:name, :cover)
  end
end
