class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show, :destroy]
  def index
    @cocktails = Cocktail.all
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail
    else
      render :new
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def show
  end

  def destroy
    @cocktail.destroy
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
