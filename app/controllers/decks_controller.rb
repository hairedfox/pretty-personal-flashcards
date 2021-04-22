# frozen_string_literal: true

class DecksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_deck, only: %i[deactivate restore]

  def index
    @decks = current_user.decks.order(created_at: :desc).includes(cover_attachment: :blob)
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = current_user.decks.build(deck_params)
    if @deck.save
      flash[:success] = t('.succeeded')
      redirect_to decks_url
    else
      flash[:danger] = t('.failed')
      render :new
    end
  end

  def deactivate
    @deck.discard
    flash[:success] = t('.succeeded')
    redirect_to decks_url
  end

  def restore
    @deck.undiscard
    flash[:success] = t('.succeeded')
    redirect_to decks_url
  end

  private

  def deck_params
    params.require(:deck).permit(:name, :cover)
  end

  def set_deck
    @deck = current_user.decks.find(params[:id])
  end
end
