# frozen_string_literal: true

class ConfirmationsController < ApplicationController
  def show
    resource = User.confirm_by_token(params[:confirmation_token])
    sign_in(resource)
    redirect_to root_path
  end
end
