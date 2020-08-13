class DosesController < ApplicationController
  def new
    @ingredients = Ingredient.all
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @ingredient = Ingredient.find(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)

    @dose.ingredient = @ingredient
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to @cocktail
    else
      render :new
    end
  end

  def destroy
  end

  private
  def dose_params
    params.require(:dose).permit(:description, :ingredient)
  end
end
