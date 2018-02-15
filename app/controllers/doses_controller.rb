class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @ingredients = Ingredient.all.sort_by { |ingredient| - ingredient.name.downcase }

  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if Ingredient.exists?(params[:dose][:ingredient_id])
      @dose.ingredient = Ingredient.find(params[:dose][:ingredient_id])
    else
      @dose.ingredient = nil
    end
    if @dose.valid?
      @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end
end
