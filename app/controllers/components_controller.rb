class ComponentsController < ApplicationController

  def index
    render json: {'components': Component.all }
  end

  def show
    render json: Component.find(params[:id])
  end

end
