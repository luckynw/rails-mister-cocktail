class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show]
  def index
    @cocktails = Cocktail.all
  end

  def create
    @cocktail
  end

  def new
    @cocktail = Cocktail.new
  end

  def show
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params(:plant).permit(:name)
  end
end
