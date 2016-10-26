class ReferencesController < ApplicationController

  def index
    render json: {'references': Reference.where(component_id: params[:component_id]) }
  end

  def show
    render json: Reference.find(params[:id])
  end


end
