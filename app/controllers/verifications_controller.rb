class VerificationsController < ApplicationController

  def index
    render json: {'verifications': Component.find_by(id: params[:component_id]).verifications }
  end

  def show
    render json: Verification.find(params[:id])
  end

end
