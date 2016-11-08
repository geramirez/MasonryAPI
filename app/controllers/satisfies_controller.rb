class SatisfiesController < ApplicationController
  def index
    render json: {'satisfies': Satisfy.all }
  end

  def show
    render json: Satisfy.find(params[:id])
  end

end
